import 'package:bloc_auth/models/auth_state_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AuthState extends Equatable {
  final authStateEnum state;
  AuthState({this.state}) : super([state]);
  AuthState copyWith({
    authStateEnum state,
  }) {
    return AuthState(
      state: state ?? this.state,
    );
  }
}
