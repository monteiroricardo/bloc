import 'package:bloc_auth/bloc/bloc.dart';
import 'package:bloc_auth/bloc/loader_bloc/loader_bloc.dart';
import 'package:bloc_auth/bloc/loader_bloc/loader_event.dart';
import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController;
  TextEditingController passwordController;
  AuthBloc authBloc;
  LoaderBloc loaderBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    loaderBloc = BlocProvider.of<LoaderBloc>(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  authBloc.dispatch(
                    ChangeStateAuthEvent(
                      authStateEnum.register,
                    ),
                  );
                },
                child: Text(
                  'Registrar',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                loaderBloc.dispatch(ChangeStateLoaderEvent(true));
                await Future.delayed(Duration(seconds: 2));
                loaderBloc.dispatch(ChangeStateLoaderEvent(false));
                authBloc.validator(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text(
                'ENTRAR',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
