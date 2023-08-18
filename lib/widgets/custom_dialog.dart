import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/custom_button.dart';

Future<void> showCustomDialog(
  BuildContext context,
  String text, {
  void Function()? onTap,
}) async {
  await showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierColor: const Color(0x562D3B51),
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Dialog(
              backgroundColor: AppColors.whiteColor,
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              insetPadding: const EdgeInsets.all(40),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 79,
                      height: 93,
                      child: Image.asset(
                        'assets/icons/opticash-logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: HelperStyle.textStyle(
                        color: AppColors.backColor,
                        fontSize: 14,
                        weight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      containerHeight: 50,
                      containerWidth: 379,
                      buttonText: "SIGN IN",
                      buttonTextSize: 16,
                      radius: 12,
                      onTap: onTap!,
                      color: AppColors.dialogButton,
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
