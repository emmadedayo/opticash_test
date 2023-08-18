import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:opticash/logic/http_service/error_message.dart';
import 'package:opticash/logic/provider/auth_provider.dart';
import 'package:opticash/logic/state/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  AuthProvider authProvider = AuthProvider();
  SignUpCubit(SignUpState initialState) : super(initialState);

  signUp() async {
    emit(state.copy());
    state.context?.loaderOverlay.show();
    emit(state.copy());
    var result = await authProvider.signUp({
      'first_name': state.firstname.text,
      'last_name': state.lastname.text,
      'email': state.emailController.text,
      'password': state.passwordController.text,
    });
    if (kDebugMode) {
      print('============================> ${result?.errorCode}');
    }
    if (result != null && result.errorCode != null && result.errorCode == 400) {
      state.listMessage.clear();
      state.listMessage = [];
      if (result.message is List) {
        for (var item in result.message) {
          state.errorMessage = ErrorMessage.fromJson(item);
          state.listMessage.add(state.errorMessage?.message ?? '');
          state.hasError = true;
          emit(state.copy());
        }
      } else {
        state.hasError = true;
        state.message = result.message ?? '';
        emit(state.copy());
      }
      state.hasError = true;
      state.context?.loaderOverlay.hide();
    } else {
      state.message = 'Account Created Successfully';
      state.hasError = false;
      state.context?.loaderOverlay.hide();
    }
    state.isLoading = false;
    emit(state.copy());
  }

  clearError() {
    state.hasError = false;
    state.isLoading = false;
    state.message = '';
    emit(state.copy());
  }

  void changePasswordVisibility() {
    state.isPasswordVisible = !state.isPasswordVisible!;
    emit(state.copy());
  }
}
