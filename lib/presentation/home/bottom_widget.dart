import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opticash/logic/cubit/app_cubit.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/presentation/home/dashboard.dart';
import 'package:opticash/widgets/custom_bottom_nav.dart';

class RootBottom extends StatelessWidget {
  const RootBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (appContext, appState) {
      return BlocProvider<AppCubit>(
        create: (context) => AppCubit(AppState()),
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: appState.pageController,
                  onPageChanged: (value) {
                    appContext.read<AppCubit>().changePage(value);
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const DashboardScreen(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 80 + MediaQuery.of(context).viewPadding.bottom,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewPadding.bottom,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 19,
                          offset: Offset(4, 8),
                          spreadRadius: 4,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomNavBarIcon(
                          titleName: 'Home',
                          assetName: 'home.svg',
                          navIndex: 0,
                          isSelected: true,
                          size: Size(30, 30),
                        ),
                        BottomNavBarIcon(
                          titleName: 'Card',
                          assetName: 'card-credit.svg',
                          navIndex: 1,
                          isSelected: false,
                          size: Size(26, 25),
                        ),
                        SizedBox(width: 60),
                        BottomNavBarIcon(
                          titleName: 'Swap',
                          assetName: 'swap.svg',
                          navIndex: 3,
                          isSelected: false,
                          size: Size(35, 22),
                        ),
                        BottomNavBarIcon(
                          titleName: 'Account',
                          assetName: 'account.svg',
                          navIndex: 4,
                          isSelected: false,
                          size: Size(35, 22),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    child: GestureDetector(
                      onTap: () {
                        //_pageController.jumpToPage(2);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            padding: const EdgeInsets.fromLTRB(7, 7, 7, 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xFF2C3E02),
                            ),
                            child: Image.asset(
                              'assets/icons/opticash-logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text(
                            'Send',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
