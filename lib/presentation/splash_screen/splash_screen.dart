import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opticash/logic/cubit/splashCubit.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/app_image.dart';
import 'package:opticash/utils/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(AppState(context: context)),
      child: BlocBuilder<SplashCubit, AppState>(
        builder: (regContext, regState) {
          return BlocListener<SplashCubit, AppState>(
              listener: (context, state) async {
                if (state.userLogin == true) {
                  Future.delayed(const Duration(seconds: 5), () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouterName.dashboardName,
                      (route) => false,
                    );
                  });
                } else {
                  Future.delayed(const Duration(seconds: 5), () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouterName.basedHome,
                      (route) => false,
                    );
                  });
                }
              },
              child: Scaffold(
                body: Container(
                  color: AppColors.backColor,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(AppImage.splashScreen, fit: BoxFit.cover, height: 481),
                      ),
                      FadeInUp(
                        child: Center(
                          child: Image.asset(
                            AppImage.logo,
                            height: 128,
                            width: 109,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
