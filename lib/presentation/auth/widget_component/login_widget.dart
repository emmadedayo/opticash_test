import 'package:flutter/material.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class LoginHavingAccount extends StatelessWidget {
  const LoginHavingAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("Forgot Password? ",
            style: HelperStyle.textStyle(
                color: AppColors.textFieldLabelColor, fontSize: 13, weight: FontWeight.w400)),
        InkWell(
          child: RichText(
            text: TextSpan(
              text: 'Don’t have account? ',
              style: HelperStyle.textStyle(
                  color: AppColors.textFieldLabelColor, fontSize: 13, weight: FontWeight.w400),
              children: [
                TextSpan(
                  text: 'Create Account',
                  style: HelperStyle.textStyle(
                      color: AppColors.mainColorText, fontSize: 13, weight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, RouterName.signUpName);
          },
        )
      ],
    ));
  }
}
