import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]): super(props);
}

class InitAuthEvent extends AuthEvent {}

class ChangeStateAuthEvent extends AuthEvent {
  final authStateEnum authState;

  ChangeStateAuthEvent(this.authState): super([authState]);
}
