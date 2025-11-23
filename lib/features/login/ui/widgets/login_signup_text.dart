import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LoginSignupText extends StatelessWidget {
  const LoginSignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account yet? ",
          style: TextStyles.font14BlackRegular,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Sign Up",
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
