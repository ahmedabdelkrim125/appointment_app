import 'package:appointment_app/core/helper/extensions.dart';
import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/features/login/logic/login_cubit.dart';
import 'package:appointment_app/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/modern_dialog_helper.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          success: (loginResponse) {
            // Close loading dialog
            Navigator.of(context).pop();

            // Show success dialog
            ModernDialog.showSuccess(
              context: context,
              title: 'Welcome Back!',
              message: 'You have successfully logged in.',
              buttonText: 'Continue',
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
            );
          },
          error: (message) {
            // Close loading dialog if it's open
            Navigator.of(context).pop();

            // Show error dialog
            ModernDialog.showError(
              context: context,
              title: 'Login Failed',
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
