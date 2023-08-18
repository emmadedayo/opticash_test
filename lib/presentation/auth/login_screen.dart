import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opticash/logic/cubit/login_cubit.dart';
import 'package:opticash/logic/state/login_state.dart';
import 'package:opticash/presentation/auth/widget_component/login_form.dart';
import 'package:opticash/presentation/auth/widget_component/login_widget.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/app_image.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/custom_toast.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginState(context: context)),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (regContext, regState) {
          return BlocListener<LoginCubit, LoginState>(
              listener: (context, state) async {
                if (state.hasError == true && state.message != null) {
                  ToastUtils.displayErrorMessage(context, state.message!);
                  context.read<LoginCubit>().state.hasError = null;
                  context.read<LoginCubit>().state.message = null;
                }
                if (state.hasError == false && state.user != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouterName.homeName,
                    (route) => false,
                  );
                  context.read<LoginCubit>().state.hasError = null;
                  context.read<LoginCubit>().state.message = null;
                }
              },
              child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                body: SafeArea(
                  child: Stack(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                  margin: const EdgeInsets.only(top: 20, left: 20),
                                  height: 34.761905670166016,
                                  width: 30.535715103149414,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border.all(
                                      color: AppColors.backBorderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImage.backArrow,
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: HelperStyle.textStyle(
                                      color: AppColors.mainColorText,
                                      fontSize: 30,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Sign In to your account using your email address and password",
                                    style: HelperStyle.textStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 11,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  LoginForm(
                                    state: regState,
                                    cubit: regContext.read<LoginCubit>(),
                                  ),
                                  SizedBox(height: 20.h),
                                  const LoginHavingAccount(),
                                  SizedBox(height: 20.h),
                                  ButtonWidget(
                                    containerHeight: 60,
                                    containerWidth: 379,
                                    buttonText: "SIGN IN",
                                    buttonTextSize: 16,
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      if (regState.formKey!.currentState!.validate()) {
                                        await regContext.read<LoginCubit>().loginIn();
                                      } else {
                                        ToastUtils.displayErrorMessage(
                                            context, 'Please fill in all fields');
                                      }
                                    },
                                    color: AppColors.backColor,
                                    textColor: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
