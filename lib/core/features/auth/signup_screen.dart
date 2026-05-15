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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _RegestarScreenState();
}

class _RegestarScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 59.h, left: 24.w, right: 25.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 262.w,
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackcolor,
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Text(
                      "Let’s create your account.",
                      style: AppStyles.secondaryheadlinestyle,
                    ),
                    Gap(24.h),
                    Text("Full Name", style: AppStyles.black16w500style),
                    Gap(4.h),
                    CustomTextField(
                      controller: fullnameController,
                      hintText: "Enter your full name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                    ),
                    Gap(16.h),
                    Text("User Name", style: AppStyles.black16w500style),
                    Gap(4.h),
                    CustomTextField(
                      controller: usernameController,
                      hintText: "Enter your User Name",
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Please enter your User Name";
                      //   }
                      //   return null;
                      // },
                    ),
                    Gap(16.h),
                    Text("Password", style: AppStyles.black16w500style),
                    Gap(4.h),
                    CustomTextField(
                      controller: passwordController,
                      hintText: " Enter your Password",
                      // validator: (value) {
                      //   if (value == null || value.isEmpty || value.length < 6) {
                      //     return "Please enter your password at least 6 characters";
                      //   }
                      //   return null;
                      // },
                    ),
                    Gap(16.h),
                    Text("Confirm Password", style: AppStyles.black16w500style),
                    Gap(4.h),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: "Enter your Password",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return "Please enter your password at least 6 characters";
                        }
                        if (value != passwordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                    ),
                    Gap(42.h),
                    PrimaryButtonwidget(
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          print(usernameController.text);
                          print(fullnameController.text);
                          print(passwordController.text);
                          print(confirmPasswordController.text);
                        }
                      },
                      buttontext: "Create Account",
                      buttoncolor: AppColors.primarycolor,
                      textColor: Colors.white,
                      width: 331.w,
                      height: 56.h,
                      borderradius: 8,
                      fontsize: 15,
                    ),

                    Gap(190.h),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: AppStyles.black16boldstyle.copyWith(
                            color: AppColors.primarycolor,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: AppStyles.black16boldstyle.copyWith(
                                color: AppColors.blackcolor,
                                fontSize: 15.sp,
                              ),
                              recognizer:
                                  TapGestureRecognizer() //عشان لما بدنا نعمل الكلمة كزر
                                    ..onTap = () {
                                      RouterGenretionConfig.goRouter.pushNamed(
                                        AppRoutes.loginscreen,
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
