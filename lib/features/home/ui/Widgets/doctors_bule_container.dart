import 'package:appointment_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class DoctorsBuleContainer extends StatelessWidget {
  const DoctorsBuleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: .bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: .symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.homeBulePattern),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctors',
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(height: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.r),
                      ), // RoundedRectangleBorder
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font12BlueRegular,
                    ), // Text
                  ),
                ), // ElevatedButton
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            top: 0,
            child: Image.asset(AppImages.person, height: 200.h),
          ),
        ],
      ),
    );
  }
}
