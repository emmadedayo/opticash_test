import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:opticash/logic/cubit/login_cubit.dart';
import 'package:opticash/logic/state/login_state.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/textfield_widget.dart';

class LoginForm extends StatelessWidget {
  final LoginState state;
  final LoginCubit cubit;
  const LoginForm({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          TextFieldWidget(
            hintText: "Email",
            textInputType: TextInputType.text,
            controller: state.emailController,
            validator: MultiValidator([
              RequiredValidator(errorText: "* Required"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
              ),
              contentPadding: const EdgeInsets.all(15),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9FB),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Email",
                  style: HelperStyle.textStyle(
                      color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                ),
              ),
              labelStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
              hintText: "Enter your email",
              hintStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            hintText: "Password",
            textInputType: TextInputType.text,
            isPassword: state.isPasswordVisible,
            controller: state.passwordController,
            validator: MultiValidator([
              RequiredValidator(errorText: "* Required"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0),
              ),
              contentPadding: const EdgeInsets.all(15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: IconButton(
                icon: Icon(
                  state.isPasswordVisible! ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textFieldLabelColor,
                ),
                onPressed: () {
                  cubit.changePasswordVisibility();
                },
              ),
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9FB),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Password",
                  style: HelperStyle.textStyle(
                      color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                ),
              ),
              labelStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
              hintText: "Enter your password",
              hintStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
