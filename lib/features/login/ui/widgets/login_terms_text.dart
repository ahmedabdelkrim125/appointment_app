import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LoginTermsText extends StatelessWidget {
  const LoginTermsText({super.key});

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
          TextSpan(
            text: "and\n",
            style: TextStyles.font14GreyRegular,
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyles.font14BlackMedium,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
