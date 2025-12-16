import 'package:appointment_app/core/helper/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/spacing.dart';
import '../theme/text_styles.dart';

/// -----------------------------
/// Password Validation Indicator Widget
/// -----------------------------
class PasswordValidationIndicator extends StatelessWidget {
  final String password;
  const PasswordValidationIndicator({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final validations = AppValidator.getPasswordValidations(password);

    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Password requirements:", style: TextStyles.font13grayBold),
          verticalSpace(height: 8),
          ...validations.map((validation) => _buildValidationRow(validation)),
        ],
      ),
    );
  }

  Widget _buildValidationRow(PasswordValidation validation) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Icon(
            validation.isValid ? Icons.check_circle : Icons.circle_outlined,
            size: 18.sp,
            color: validation.isValid ? Colors.green : Colors.grey[400],
          ),
          horizontalSpace(width: 8),
          Expanded(
            child: Text(
              validation.label,
              style: TextStyle(
                fontSize: 13.sp,
                color: validation.isValid
                    ? Colors.green[700]
                    : Colors.grey[600],
                decoration: validation.isValid
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
