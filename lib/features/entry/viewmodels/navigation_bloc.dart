import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/entry/viewmodels/navigation_event.dart';
import 'package:learning_app/features/entry/viewmodels/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<NavigateToTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}
