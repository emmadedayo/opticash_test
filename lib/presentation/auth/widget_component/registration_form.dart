import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:opticash/logic/cubit/signup_cubit.dart';
import 'package:opticash/logic/state/signup_state.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpState state;
  final SignUpCubit cubit;
  const SignUpScreen({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          TextFieldWidget(
            hintText: "First Name",
            textInputType: TextInputType.text,
            controller: state.firstname,
            validator: MultiValidator([
              RequiredValidator(errorText: "* First Name is required"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
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
                  "First Name",
                  style: HelperStyle.textStyle(
                      color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                ),
              ),
              labelStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
              hintText: "Your First Name",
              hintStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            hintText: "Last Name",
            textInputType: TextInputType.text,
            controller: state.lastname,
            validator: MultiValidator([
              RequiredValidator(errorText: "* Last Name Required"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
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
                  "Last Name",
                  style: HelperStyle.textStyle(
                      color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
                ),
              ),
              labelStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
              hintText: "Your Last Name",
              hintStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            hintText: "Email",
            textInputType: TextInputType.text,
            controller: state.emailController,
            validator: MultiValidator([
              RequiredValidator(errorText: "* Email Required"),
              EmailValidator(errorText: "* Invalid Email"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
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
              hintText: "Your Email",
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
              RequiredValidator(errorText: "* Password Required"),
            ]),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: const OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
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
              hintText: "Your Password",
              hintStyle: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 11, weight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
