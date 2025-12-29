import '../../data/models/signup_request_body.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/app_form_field.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/password_validation_indicator.dart';
import '../../logic/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  bool isConfirmObscureText = true;
  String selectedGender = 'Male'; // Default value

  void _handleSignup() {
    final cubit = context.read<SignupCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitSignupStates(
        SignupRequestBody(
          name: cubit.nameController.text,
          email: cubit.emailController.text,
          phone: cubit.phoneController.text,
          gender: selectedGender == 'Male'
              ? '0'
              : '1', // '0' for Male, '1' for Female
          password: cubit.passwordController.text,
          passwordConfirmation: cubit.passwordConfirmationController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppFormField(
            controller: cubit.nameController,
            hintText: 'Name',
            validator: AppValidator.validateName,
          ),
          verticalSpace(height: 18),
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
          verticalSpace(height: 18),
          AppFormField(
            controller: cubit.passwordConfirmationController,
            hintText: 'Confirm Password',
            validator: (value) => AppValidator.validateConfirmPassword(
              value,
              cubit.passwordController.text,
            ),
            obscureText: isConfirmObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isConfirmObscureText = !isConfirmObscureText;
                });
              },
              icon: Icon(
                isConfirmObscureText ? Icons.visibility_off : Icons.visibility,
                color: isConfirmObscureText
                    ? AppColors.gray
                    : AppColors.primary,
              ),
            ),
          ),
          verticalSpace(height: 18),
          // Phone Number with Country Code
          Row(
            children: [
              // Phone Number Field
              Expanded(
                child: AppFormField(
                  controller: cubit.phoneController,
                  hintText: 'Your number',
                  keyboardType: TextInputType.phone,
                  validator: AppValidator.validatePhone,
                ),
              ),
            ],
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
            buttonText: 'Create Account',
            onPressed: _handleSignup,
          ),
          
        ],
      ),
    );
  }
}
