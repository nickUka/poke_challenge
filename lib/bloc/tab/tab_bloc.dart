import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial()) {
    on<TabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
