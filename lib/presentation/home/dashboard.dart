import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opticash/logic/cubit/app_cubit.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/custom_action_bar.dart';
import 'package:opticash/widgets/custom_home_transaction.dart';
import 'package:opticash/widgets/home_carosel.dart';
import 'package:opticash/widgets/home_quick_action.dart';
import 'package:opticash/widgets/widget_balance.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (appContext, appState) {
      return BlocProvider<AppCubit>(
          create: (context) => AppCubit(AppState()),
          child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                toolbarHeight: 76,
                elevation: 1,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/images/profile_image.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello ${appState.user?.firstName ?? 'name'}',
                                style: HelperStyle.textStyle(
                                  color: AppColors.backBorderColor,
                                  fontSize: 18,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '@${appState.user?.userName ?? 'username'}',
                                style: HelperStyle.textStyle(
                                  color: AppColors.greyColor,
                                  fontSize: 10,
                                  weight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 17),
                        const ActionBarWidget(assetName: 'history'),
                        const ActionBarWidget(assetName: 'notification', number: 2),
                        const SizedBox(width: 17),
                      ],
                    ),
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/auth/money-pattern.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor.withOpacity(0.4),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      top: 13,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            BalanceContainer(
                              appState: appState,
                              appCubit: appContext.read<AppCubit>(),
                            ),
                            Container(
                              height: 72,
                              color: AppColors.dashboardColor,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  HomeQuickAction(
                                    assetName: 'send',
                                    title: 'Send Money',
                                  ),
                                  VerticalDivider(
                                    indent: 10,
                                    endIndent: 10,
                                    color: Color(0xFFE9E9E9),
                                    width: 0,
                                    thickness: 1,
                                  ),
                                  HomeQuickAction(
                                    assetName: 'wallet',
                                    title: 'Top-Up',
                                  ),
                                  VerticalDivider(
                                    indent: 10,
                                    endIndent: 10,
                                    color: Color(0xFFE9E9E9),
                                    width: 0,
                                    thickness: 1,
                                  ),
                                  HomeQuickAction(
                                    assetName: 'bank',
                                    title: 'Account Details',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const CarouselPage(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today, 26 june 2021',
                              style: HelperStyle.textStyle(
                                color: AppColors.transactionColor,
                                fontSize: 16,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: appState.transactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return TransactionCard(
                              transactionData: appState.transactions[index],
                            );
                          },
                        )
                      ],
                    ),
                  ))
                ],
              )));
    });
  }
}
