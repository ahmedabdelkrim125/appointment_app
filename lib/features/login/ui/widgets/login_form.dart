import '../../data/models/login_request_body.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/app_form_field.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/password_validation_indicator.dart';
import '../../logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;

  void _handleLogin() {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates(
        LoginRequestBody(
          email: cubit.emailController.text,
          password: cubit.passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            validator: AppValidator.validateEmail,
          ),
          verticalSpace(height: 18),
          AppFormField(
            controller: cubit.passwordController,
            hintText: 'Password',
            validator: AppValidator.validatePassword,
            obscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: isObscureText ? AppColors.gray : AppColors.primary,
              ),
            ),
          ),
          verticalSpace(height: 24),
          ValueListenableBuilder(
            valueListenable: cubit.passwordController,
            builder: (context, value, child) {
              return PasswordValidationIndicator(password: value.text);
            },
          ),
          verticalSpace(height: 40),
          AppTextButton(
            textStyle: TextStyles.font16WhiteSemiBold,
            buttonText: 'Login',
            onPressed: _handleLogin,
          ),
        ],
      ),
    );
  }
}
