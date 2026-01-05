import 'package:appointment_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/text_styles.dart';

class DoctorsRecommendationListView extends StatelessWidget {
  const DoctorsRecommendationListView({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'name': 'Dr. Randy Wigham',
        'speciality': 'General',
        'hospital': 'RSUD Gatot Subroto',
        'rating': '4.8',
        'reviews': '4,279',
        'image': AppImages.doctor1,
      },
      {
        'name': 'Dr. John Sulivan',
        'speciality': 'Neurologic',
        'hospital': 'RSUD Gatot Subroto',
        'rating': '4.9',
        'reviews': '3,847',
        'image': AppImages.doctor2,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200, width: 1),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  doctor['image']!,
                  width: 110.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor['name']!, style: TextStyles.font16BlackBold),
                    verticalSpace(height: 8.h),
                    Text(
                      '${doctor['speciality']} | ${doctor['hospital']}',
                      style: TextStyles.font12GruyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.r),
                        horizontalSpace(width: 4.w),
                        Text(
                          '${doctor['rating']} (${doctor['reviews']} reviews)',
                          style: TextStyles.font12BlueRegular.copyWith(
                            color: AppColors.charcoal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
