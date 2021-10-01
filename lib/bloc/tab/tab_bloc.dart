import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/tab/tab_event.dart';

class TabBloc extends Bloc<TabEvent, int> {
  TabBloc() : super(0) {
    on<TabUpdate>((event, emit) => emit(event.tab));
  }
}
