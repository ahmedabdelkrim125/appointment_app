import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class DoctorsRecommendation extends StatelessWidget {
  const DoctorsRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Recommendation Doctor', style: TextStyles.font18DarkSemiBold),
        Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'See All',
            style: TextStyles.font12GruyRegular.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
