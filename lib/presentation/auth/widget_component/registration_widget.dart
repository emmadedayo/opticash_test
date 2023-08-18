import 'package:flutter/material.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class RegistrationAgreement extends StatelessWidget {
  const RegistrationAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: RichText(
        text: TextSpan(
          text: 'By signing up you agree to our ',
          style: HelperStyle.textStyle(
              color: AppColors.textFieldLabelColor, fontSize: 13, weight: FontWeight.w400),
          children: [
            TextSpan(
              text: 'terms of use',
              style: HelperStyle.textStyle(
                  color: AppColors.mainColorText, fontSize: 14, weight: FontWeight.bold),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'privacy policy',
              style: HelperStyle.textStyle(
                  color: AppColors.mainColorText, fontSize: 14, weight: FontWeight.bold),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    ));
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.signInName);
      },
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: HelperStyle.textStyle(
              color: AppColors.textFieldLabelColor, fontSize: 13, weight: FontWeight.w400),
          children: [
            //
            TextSpan(
              text: 'Sign In',
              style: HelperStyle.textStyle(
                  color: AppColors.mainColorText, fontSize: 13, weight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}
