import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  @override
  LoaderState get initialState => LoaderState(state: false);

  @override
  Stream<LoaderState> mapEventToState(
    LoaderEvent event,
  ) async* {
    if (event is InitLoaderEvent) {
      yield LoaderState(state: false);
    }
    if (event is ChangeStateLoaderEvent) {
      yield LoaderState(
        state: event.loaderrState,
      );
    }
  }
}
