import '../../../core/helper/spacing.dart';
import '../../../core/theme/text_styles.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_form.dart';
import 'widgets/login_signup_text.dart';
import 'widgets/login_terms_text.dart';
import 'widgets/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const LoginForm(),
                verticalSpace(height: 16),
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
                const SocialLoginSection(),
                verticalSpace(height: 32),
                const LoginTermsText(),
                verticalSpace(height: 24),
                const LoginSignupText(),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
