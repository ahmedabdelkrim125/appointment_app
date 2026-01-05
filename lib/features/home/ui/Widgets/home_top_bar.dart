import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/text_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          mainAxisAlignment: .start,
          children: [
            Text(
              'Hi, Ahmed!',
              style: TextStyles.font18DarkkBold.copyWith(color: AppColors.dark),
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font11DarkGrayRegular.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.whitesmoke,
          radius: 24,
          child: SvgPicture.asset(AppImages.notifications),
        ),
      ],
    );
  }
}
