import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opticash/logic/cubit/signup_cubit.dart';
import 'package:opticash/logic/state/signup_state.dart';
import 'package:opticash/presentation/auth/widget_component/registration_form.dart';
import 'package:opticash/presentation/auth/widget_component/registration_widget.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/utils/app_image.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/custom_toast.dart';
import 'package:opticash/utils/helper_style.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/custom_dialog.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
//context.loaderOverlay.visible
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(SignUpState(context: context)),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (regContext, regState) {
          return BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) async {
                if (state.hasError == true && state.message != null) {
                  ToastUtils.displayErrorMessage(context, state.message!);
                  context.read<SignUpCubit>().state.hasError = null;
                  context.read<SignUpCubit>().state.message = null;
                }
                if (state.hasError == true && state.listMessage.isNotEmpty) {
                  for (int i = 0; i < state.listMessage!.length; i++) {
                    ToastUtils.displayErrorMessage(context, state.listMessage![i]);
                  }
                  context.read<SignUpCubit>().state.hasError = null;
                  context.read<SignUpCubit>().state.message = null;
                }

                if (state.hasError == false && state.message != null) {
                  showCustomDialog(
                    context,
                    'Account Created Successfully ',
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.signInName);
                    },
                  );
                  context.read<SignUpCubit>().state.hasError = null;
                  context.read<SignUpCubit>().state.message = null;
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
                              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Create Account",
                                    style: HelperStyle.textStyle(
                                        color: AppColors.mainColorText,
                                        fontSize: 30,
                                        weight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Register a new account using your email address and fill in your information's",
                                    style: HelperStyle.textStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 11,
                                        weight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SignUpScreen(
                                    state: regState,
                                    cubit: regContext.read<SignUpCubit>(),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const CreateAccount(),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ButtonWidget(
                                    containerHeight: 60,
                                    containerWidth: 379,
                                    buttonText: "Create New Account",
                                    buttonTextSize: 16,
                                    onTap: () async {
                                      //validate form
                                      FocusScope.of(context).unfocus();
                                      if (regState.formKey!.currentState!.validate()) {
                                        await regContext.read<SignUpCubit>().signUp();
                                      } else {
                                        ToastUtils.displayErrorMessage(
                                            context, 'Please fill in all fields');
                                      }
                                    },
                                    color: AppColors.backColor,
                                    textColor: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  const RegistrationAgreement(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))));
        },
      ),
    );
  }
}
