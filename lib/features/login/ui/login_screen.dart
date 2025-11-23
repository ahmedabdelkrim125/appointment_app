import 'package:appointment_app/core/helper/spacing.dart';
import 'package:appointment_app/core/helper/validation.dart';
import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:appointment_app/core/widgets/app_form_field.dart';
import 'package:appointment_app/core/widgets/app_text_button.dart';
import 'package:appointment_app/features/login/ui/widgets/login_signup_text.dart';
import 'package:appointment_app/features/login/ui/widgets/login_terms_text.dart';
import 'package:appointment_app/features/login/ui/widgets/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(height: 8),
                Text(
                  "We're excited to have you back, can't wait t\n see what you've been up to since you last\n logged in.",
                  style: TextStyles.font14GruyRegular,
                ),
                verticalSpace(height: 36),

                // ---------------------- FORM ----------------------
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppFormField(
                        hintText: 'Email',
                        validator: AppValidator.validateEmail,
                      ),
                      verticalSpace(height: 18),
                      AppFormField(
                        hintText: 'Password',
                        validator: AppValidator.validatePassword,
                        obscureText: isObscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: isObscureText
                                ? AppColors.gray
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      verticalSpace(height: 25),

                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.font13BlueRegular,
                          ),
                        ),
                      ),
                      verticalSpace(height: 40),

                      // ---------------------- LOGIN BUTTON ----------------------
                      AppTextButton(
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonText: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint("VALID ✔");
                          }
                        },
                      ),

                      verticalSpace(height: 46),
                      SocialLoginSection(),
                      verticalSpace(height: 32),
                      LoginTermsText(),
                      verticalSpace(height: 24),
                      LoginSignupText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
