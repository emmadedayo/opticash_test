import 'package:flutter/material.dart';
import 'package:opticash/logic/http_service/error_message.dart';

class SignUpState {
  bool isLoading;
  bool? hasError;
  String? message;
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  List<String> listMessage = [];
  String? data;
  bool? isPasswordVisible;
  BuildContext? context;
  ErrorMessage? errorMessage;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignUpState(
      {this.isLoading = false,
      this.message,
      this.hasError,
      this.data,
      this.context,
      this.isPasswordVisible = true,
      this.errorMessage});
  SignUpState copy() {
    SignUpState copy = SignUpState(
        isLoading: isLoading,
        message: message,
        hasError: hasError,
        data: data,
        isPasswordVisible: isPasswordVisible,
        context: context,
        errorMessage: errorMessage);
    copy.firstname = firstname;
    copy.lastname = lastname;
    formKey = formKey;
    copy.errorMessage = errorMessage;
    copy.emailController = emailController;
    copy.passwordController = passwordController;
    return copy;
  }
}
