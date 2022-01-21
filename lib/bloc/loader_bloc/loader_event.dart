import 'package:equatable/equatable.dart';

abstract class LoaderEvent extends Equatable {
  LoaderEvent([List props = const []]) : super(props);
}

class InitLoaderEvent extends LoaderEvent {}

class ChangeStateLoaderEvent extends LoaderEvent {
  final bool loaderrState;

  ChangeStateLoaderEvent(this.loaderrState) : super([loaderrState]);
}
