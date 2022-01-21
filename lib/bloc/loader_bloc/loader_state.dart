import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class LoaderState extends Equatable {
  final bool state;
  LoaderState({this.state}) : super([state]);

  LoaderState copyWith({
    bool state,
  }) {
    return LoaderState(
      state: state ?? this.state,
    );
  }
}
