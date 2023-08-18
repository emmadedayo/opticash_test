import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String titleName;
  final String assetName;
  final int? navIndex;
  final Size size;
  final bool isSelected;

  const BottomNavBarIcon({
    super.key,
    required this.titleName,
    required this.assetName,
    this.navIndex,
    required this.size,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SvgPicture.asset(
            'assets/svg/$assetName',
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.secondaryColor : const Color(0xffA7A7A7),
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          titleName,
          style: HelperStyle.textStyle(
            color: isSelected ? AppColors.secondaryColor : const Color(0xffA7A7A7),
            fontSize: 10,
            weight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
