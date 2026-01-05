import 'package:appointment_app/core/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final specialities = [
      {'name': 'General', 'icon': AppImages.general},
      {'name': 'Neurologic', 'icon': AppImages.neurologic},
      {'name': 'Pediatric', 'icon': AppImages.pediatric},
      {'name': 'Radiology', 'icon': AppImages.radiology},
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialities.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.blueAccent.withOpacity(0.1),
                  child: Image.asset(
                    specialities[index]['icon']!,
                    width: 30.r,
                    height: 30.r,
                  ),
                ),
            verticalSpace(height: 8),
                Text(
                  specialities[index]['name']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
