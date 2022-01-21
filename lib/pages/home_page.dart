import 'package:bloc_auth/bloc/bloc.dart';
import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc authBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              authBloc.dispatch(
                ChangeStateAuthEvent(
                  authStateEnum.public,
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'HOME',
        ),
      ),
      body: Container(),
    );
  }
}
