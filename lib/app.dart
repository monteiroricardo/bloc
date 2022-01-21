import 'package:bloc_auth/bloc/bloc.dart';
import 'package:bloc_auth/bloc/loader_bloc/loader_bloc.dart';
import 'package:bloc_auth/bloc/loader_bloc/loader_state.dart';
import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:bloc_auth/routes.dart';
import 'package:bloc_auth/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

class Application extends StatefulWidget {
  const Application({Key key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  AuthBloc authBloc;
  LoaderBloc loaderBloc;
  @override
  void initState() {
    authBloc = AuthBloc();
    loaderBloc = LoaderBloc();
    super.initState();
  }

  @override
  void dispose() {
    authBloc.dispose();
    loaderBloc.dispose();
    super.dispose();
  }

  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  void applyAfter(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          builder: (BuildContext context) => authBloc,
        ),
        BlocProvider<LoaderBloc>(
          builder: (BuildContext context) => loaderBloc,
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          String initialRoute;
          if (state.state == authStateEnum.splash) {
            initialRoute = kSplashPage;
          } else if (state.state == authStateEnum.logged) {
            initialRoute = kHomePage;
          } else if (state.state == authStateEnum.public) {
            initialRoute = kLoginPage;
          } else if (state.state == authStateEnum.register) {
            initialRoute = kRegister;
          } else {
            initialRoute = kLoginPage;
          }

          applyAfter(() {
            navKey.currentState.pushNamedAndRemoveUntil(
                initialRoute, ModalRoute.withName('/'));
          });

          return MaterialApp(
            key: ValueKey(state),
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: (RouteSettings settings) {
              throw Exception('unknown route');
            },
            builder: (context, widget) {
              ErrorWidget.builder = (
                FlutterErrorDetails errorDetails,
              ) {
                return CustomErrorWidget();
              };
              return BlocBuilder<LoaderBloc, LoaderState>(
                bloc: loaderBloc,
                builder: (context, state) => Stack(
                  children: [
                    widget,
                    Visibility(
                      visible: state.state,
                      child: Container(
                        color: Colors.black12,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  RouteFactory onGenerateRoute = (RouteSettings settings) {
    final name = settings.name;
    print("Going to: " + name);
    return routes[name](settings.arguments);
  };
}
