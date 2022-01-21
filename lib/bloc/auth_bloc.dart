import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_auth/models/auth_state_enum.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthState(state: authStateEnum.splash);

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is InitAuthEvent) {
      yield AuthState(state: authStateEnum.splash);
    }
    if (event is ChangeStateAuthEvent) {
      yield AuthState(state: event.authState);
    }
  }

  validator(String email, String password) async {
    if (email == 'ricardo@gmail.com' && password == '123456') {
      dispatch(ChangeStateAuthEvent(authStateEnum.logged));
    } else {}
  }
}
