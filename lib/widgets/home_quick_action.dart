import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class HomeQuickAction extends StatelessWidget {
  final String assetName;
  final String title;

  const HomeQuickAction({
    Key? key,
    required this.assetName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/svg/$assetName.svg'),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: HelperStyle.textStyle(
              color: AppColors.actionTextColor,
              fontSize: 10,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
