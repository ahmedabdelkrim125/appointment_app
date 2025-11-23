import 'package:appointment_app/core/theme/app_images.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.docLogo),
        Text(
          'Docdoc',
          style: TextStyles.font24BlackBlod,
        ),
      ],
    );
  }
}
