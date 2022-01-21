import 'package:bloc_auth/bloc/bloc.dart';
import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void applyAfter(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }

  AuthBloc authBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    applyAfter(() async {
      await Future.delayed(Duration(seconds: 3));
      authBloc.dispatch(
        ChangeStateAuthEvent(
          authStateEnum.public,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(
              ('carregando recursos'),
            ),
          ],
        ),
      ),
    );
  }
}
