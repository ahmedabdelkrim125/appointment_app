import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SignupTermsText extends StatelessWidget {
  const SignupTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "By logging, you agree to our ",
            style: TextStyles.font14GreyRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyles.font14BlackMedium,
          ),
          TextSpan(text: "and\n", style: TextStyles.font14GreyRegular),
          TextSpan(text: "PrivacyPolicy.", style: TextStyles.font14BlackMedium),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
