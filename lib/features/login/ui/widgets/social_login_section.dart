import 'package:appointment_app/core/helper/spacing.dart';
import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/core/theme/app_images.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------- OR SIGN IN WITH ----------
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: AppColors.neutralGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Or sign in with",
                style: TextStyles.font12GruyRegular,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: AppColors.neutralGrey,
              ),
            ),
          ],
        ),

        verticalSpace(height: 32),

        // ---------- SOCIAL ICONS ----------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialCircle(AppImages.google),
            SizedBox(width: 16.w),
            _socialCircle(AppImages.facebook),
            SizedBox(width: 16.w),
            _socialCircle(AppImages.apple),
          ],
        )
      ],
    );
  }

  Widget _socialCircle(String assetPath) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.neutralGrey.withOpacity(.5),
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: 26.w,
        ),
      ),
    );
  }
}
