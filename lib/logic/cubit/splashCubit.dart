import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:opticash/logic/state/app_state.dart';

class SplashCubit extends Cubit<AppState> {
  SplashCubit(AppState initialState) : super(initialState) {
    initAnimationController();
  }

  initAnimationController() async {
    //navigate after 3 seconds using duration
    //check if user is logged in
    if (await Hive.boxExists('USER_OBJECT')) {
      state.userLogin = true;
    } else {
      state.userLogin = false;
    }
    emit(state.copy());
  }
}
