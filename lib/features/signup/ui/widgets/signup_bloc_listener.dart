import 'package:appointment_app/core/helper/extensions.dart';
import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/features/signup/logic/signup_cubit.dart';
import 'package:appointment_app/features/signup/logic/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/modern_dialog_helper.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          },
          success: (signupResponse) {
            // Close loading dialog
            Navigator.of(context).pop();

            // Show success dialog
            ModernDialog.showSuccess(
              context: context,
              title: 'Account Created!',
              message: 'Your account has been successfully created.',
              buttonText: 'Get Started',
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
            );
          },
          error: (message) {
            // Close loading dialog if it's open
            Navigator.of(context).pop();

            // Show error dialog
            ModernDialog.showError(
              context: context,
              title: 'Signup Failed',
              message: message,
              buttonText: 'Retry',
              onPressed: () {
                // Optionally trigger retry logic
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
