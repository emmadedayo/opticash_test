import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opticash/utils/app_image.dart';
import 'package:opticash/utils/color.dart'; // Make sure to import the Svg package

class AppBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const AppBarWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          height: 34.761905670166016,
          width: 30.535715103149414,
          decoration: BoxDecoration(
            color: AppColors.backColor,
            border: Border.all(
              color: AppColors.backColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImage.backArrow,
            ),
          ),
        ),
      ),
    );
  }
}
