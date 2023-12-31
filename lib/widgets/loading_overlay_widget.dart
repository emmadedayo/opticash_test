import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:opticash/utils/color.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final Widget child;
  const LoadingOverlayWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        useDefaultLoading: false,
        disableBackButton: true,
        closeOnBackButton: false,
        overlayOpacity: 0.8,
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        overlayColor: AppColors.backColor,
        overlayWidget: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: AppColors.whiteColor,
            secondRingColor: AppColors.mainColor,
            thirdRingColor: AppColors.secondaryColor,
            size: 30,
          ),
        ),
        child: child);
  }
}
