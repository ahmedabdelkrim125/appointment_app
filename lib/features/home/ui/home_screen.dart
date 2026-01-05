import 'package:appointment_app/core/helper/spacing.dart';
import 'package:appointment_app/features/home/ui/Widgets/doctors_bule_container.dart';
import 'package:appointment_app/features/home/ui/Widgets/doctors_recommendation.dart';
import 'package:appointment_app/features/home/ui/Widgets/doctors_recommendation_list_view.dart';
import 'package:appointment_app/features/home/ui/Widgets/doctors_speciality_list_view.dart';
import 'package:appointment_app/features/home/ui/Widgets/doctors_speciality_see_all.dart';
import 'package:appointment_app/features/home/ui/Widgets/home_top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopBar(),
                DoctorsBuleContainer(),
                verticalSpace(height: 24),
                DoctorsSpecialitySeeAll(),
                DoctorsSpecialityListView(),
                verticalSpace(height: 24),
                DoctorsRecommendation(),
                verticalSpace(height: 16),
                DoctorsRecommendationListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
