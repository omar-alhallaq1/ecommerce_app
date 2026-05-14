import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/routing/router_genretion_config.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/custom_text_field.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 59.h, left: 24.w, right: 31.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(12.h),

                  Gap(28.h),
                  SizedBox(
                    width: 335.w,

                    child: Text(
                      "Login to your account",
                      style: AppStyles.primaryheadlinestyle,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    "It’s great to see you again.",
                    style: AppStyles.secondaryheadlinestyle,
                  ),
                  Gap(24.h),
                  Text("User Name", style: AppStyles.black16w500style),
                  Gap(4.h),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter User Name",
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your user name';
                    //   }
                    //   // You can add more complex email validation here if needed
                    //   return null;
                    // },
                  ),
                  Gap(15.h),
                  Text("Password", style: AppStyles.black16w500style),
                  Gap(4.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.secondarycolor,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty || value.length < 6) {
                    //     return 'Please enter your password at least 6 characters';
                    //   }
                    //   // You can add more complex password validation here if needed
                    //   return null;
                    // },
                  ),
                  Gap(55.h),
                  PrimaryButtonwidget(
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed(AppRoutes.mainScreen);
                      }
                    },
                    buttontext: "Sign In",
                    buttoncolor: AppColors.primarycolor,
                    textColor: Colors.white,
                    width: 331.w,
                  ),
                  Gap(366.h),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account ? ",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: AppColors.graycolor,
                        ),
                        children: [
                          TextSpan(
                            text: "Join",
                            style: AppStyles.black15boldstyle.copyWith(
                              color: AppColors.blackcolor,
                              fontSize: 15.sp,
                            ),
                            recognizer:
                                TapGestureRecognizer() //"عشان لما بدنا نعمل الكلمة كزر"
                                  ..onTap = () {
                                    RouterGenretionConfig.goRouter.pushNamed(
                                      AppRoutes.signupscreen,
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
