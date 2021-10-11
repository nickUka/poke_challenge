import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_test/models/navigation_pages.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<GoTo>((event, emit) => _goTo(event, state, emit));
    on<Back>((event, emit) => _back(event, state, emit));
  }
}

void _goTo(GoTo event, state, Emitter emit) async {
  if (event.page < 3 && event.page >= 0 && event.page != state.currentPage) {
    List<Widget> pages = state.pages;
    pages.add(Pages[event.page]);
    emit(NavigationState(pages: pages));
  }
}

void _back(Back event, state, Emitter emit) async {
  List<Widget> pages = state.pages;
  if (event.pagesToRemove < pages.length) {
    pages.removeRange(pages.length - event.pagesToRemove, pages.length);
    emit(NavigationState(pages: pages));
  }
}
