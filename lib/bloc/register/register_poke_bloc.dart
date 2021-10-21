
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/register/register_poke_event.dart';
import 'package:pokemon_test/bloc/register/register_poke_state.dart';

class RegisterPokeBloc extends Bloc<RegisterPokeEvent,RegisterPokeState>{
  RegisterPokeBloc():super(RegisterPokeState()){
    on<RegisterPokeEvent>((event, emit) => _setRegisterPokeValues(event, emit));
    on<RegisterPokeCleanEvent>((event, emit) => _cleanRegisterPokeValues (emit));
  }

  void _setRegisterPokeValues(RegisterPokeEvent event, Emitter emit) async{
    emit(state.copyWith(
      img: event.img,
      name: event.name,
      abilitiesSelected: event.abilitiesSelected,
      typesSelected: event.typesSelected,
      categorySelected: event.categorySelected,
      description: event.description,
    ));
  }

  void _cleanRegisterPokeValues(Emitter emit) async{
    emit(RegisterPokeState());
  }
}