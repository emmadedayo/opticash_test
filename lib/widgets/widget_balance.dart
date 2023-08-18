import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opticash/logic/cubit/app_cubit.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class BalanceContainer extends StatelessWidget {
  final AppState? appState;
  final AppCubit? appCubit;
  const BalanceContainer({super.key, this.appState, this.appCubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 10,
          child: Container(
            color: const Color(0xFFF4F4F4),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 24, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: const DecorationImage(
              image: AssetImage('assets/images/card-design.png'),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
          ),
          child: Column(
            children: [
              Container(
                width: 230,
                height: 31,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor, // Assuming oliveGreen is defined
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/coin.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Opticash Balance ',
                        style: HelperStyle.textStyle(
                          color: AppColors.whiteColor,
                          fontSize: 13,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(2, 3, 2, 2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        // color: oliveGreen, // Assuming oliveGreen is defined
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                appState!.hideBalance ? '**********' : '\$243,998',
                style: HelperStyle.textStyle(
                  color: AppColors.whiteColor,
                  fontSize: 30,
                  weight: FontWeight.w700,
                ), // Format regardless of showBalance
              ),
              const SizedBox(height: 3),
              Text(
                '123848492920304.234 (OPCH)',
                style: HelperStyle.textStyle(
                  color: AppColors.dashboardTextColor,
                  fontSize: 10,
                  weight: FontWeight.w700,
                ), //
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  appCubit!.toggleBalance();
                },
                child: Container(
                  color: Colors.transparent,
                  child: Icon(
                    appState!.hideBalance ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
