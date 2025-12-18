import '../../../core/helper/spacing.dart';
import '../../../core/theme/text_styles.dart';
import 'widgets/signup_bloc_listener.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_login_text.dart';
import 'widgets/signup_terms_text.dart';
import 'widgets/social_signup_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpace(height: 8),
                Text(
                  "Sign up now and start exploring all that our\n app has to offer. We're excited to welcome\n you to our community!",
                  style: TextStyles.font14GruyRegular,
                ),
                verticalSpace(height: 36),
                const SignupForm(),
                verticalSpace(height: 40),
                const SocialSignupSection(),
                verticalSpace(height: 32),
                const SignupTermsText(),
                verticalSpace(height: 24),
                const SignupLoginText(),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
