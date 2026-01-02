import 'package:appointment_app/core/helper/extensions.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class SignupLoginText extends StatelessWidget {
  const SignupLoginText({super.key});

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
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text("Sign In", style: TextStyles.font14BlueSemiBold),
          
        ),
      ],
    );
  }
}
