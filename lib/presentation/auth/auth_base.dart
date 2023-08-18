import 'package:flutter/material.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/horizontal_line.dart';

class AuthBase extends StatelessWidget {
  const AuthBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/base_bg.png',
                fit: BoxFit.cover,
                height: size.height * 0.7,
                width: double.infinity,
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 60,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Send Money faster than imagined",
                            style: HelperStyle.textStyle(
                                color: AppColors.whiteColor, fontSize: 30, weight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Opticash provides you the fastest remittance to send and receive money!",
                            style: HelperStyle.textStyle(
                                color: AppColors.textColor, fontSize: 14, weight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              ColoredHorizontalLine(
                                  color: AppColors.mainColor, height: 1, width: 68),
                              const SizedBox(
                                width: 10,
                              ),
                              ColoredHorizontalLine(
                                  color: AppColors.greyColor, height: 1, width: 68),
                              const SizedBox(
                                width: 10,
                              ),
                              ColoredHorizontalLine(
                                  color: AppColors.greyColor,
                                  height: 1,
                                  width: 68), // Grey, specified height and width
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ButtonWidget(
                            containerHeight: 48,
                            containerWidth: 379,
                            buttonText: "Create New Account",
                            buttonTextSize: 16,
                            onTap: () async {
                              Navigator.pushNamed(context, RouterName.signUpName);
                            },
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffa3ca00),
                                Color(0xffddda4c)
                              ], // Replace with your desired colors
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            textColor: AppColors.backColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Grey, specified height and width
                          InkWell(
                            child: Text(
                              "Login",
                              style: HelperStyle.textStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                  weight: FontWeight.w600,
                                  underline: true),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, RouterName.signInName);
                            },
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
