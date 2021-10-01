import 'package:bloc/bloc.dart';
import 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
}
