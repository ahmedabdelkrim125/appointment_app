import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType { error, success, warning, info }

class ModernDialog {
  static Future<void> show({
    required BuildContext context,
    required DialogType type,
    required String title,
    required String message,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: _DialogContent(
          type: type,
          title: title,
          message: message,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPrimaryPressed: onPrimaryPressed,
          onSecondaryPressed: onSecondaryPressed,
        ),
      ),
    );
  }

  // Quick error dialog
  static Future<void> showError({
    required BuildContext context,
    required String message,
    String title = 'Error',
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      type: DialogType.error,
      title: title,
      message: message,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  // Quick success dialog
  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
    String title = 'Success',
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      type: DialogType.success,
      title: title,
      message: message,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  // Quick warning dialog
  static Future<void> showWarning({
    required BuildContext context,
    required String message,
    String title = 'Warning',
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    return show(
      context: context,
      type: DialogType.warning,
      title: title,
      message: message,
      primaryButtonText: buttonText,
      onPrimaryPressed: onPressed,
    );
  }

  // Confirmation dialog
  static Future<void> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    DialogType type = DialogType.warning,
  }) {
    return show(
      context: context,
      type: type,
      title: title,
      message: message,
      primaryButtonText: confirmText,
      secondaryButtonText: cancelText,
      onPrimaryPressed: onConfirm,
      onSecondaryPressed: onCancel,
    );
  }
}

class _DialogContent extends StatelessWidget {
  final DialogType type;
  final String title;
  final String message;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;

  const _DialogContent({
    required this.type,
    required this.title,
    required this.message,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
  });

  Color _getMainColor() {
    switch (type) {
      case DialogType.error:
        return AppColors.error;
      case DialogType.success:
        return AppColors.success;
      case DialogType.warning:
        return AppColors.warning;
      case DialogType.info:
        return AppColors.info;
    }
  }

  Color _getLightColor() {
    switch (type) {
      case DialogType.error:
        return AppColors.errorLight;
      case DialogType.success:
        return AppColors.successLight;
      case DialogType.warning:
        return AppColors.warningLight;
      case DialogType.info:
        return AppColors.infoLight;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case DialogType.error:
        return Icons.error_outline_rounded;
      case DialogType.success:
        return Icons.check_circle_outline_rounded;
      case DialogType.warning:
        return Icons.warning_amber_rounded;
      case DialogType.info:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Container
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: _getLightColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(_getIcon(), color: _getMainColor(), size: 36.sp),
          ),
          SizedBox(height: 20.h),

          // Title
          Text(
            title,
            style: TextStyles.font18BlackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),

          // Message
          Text(
            message,
            style: TextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),

          // Buttons
          Row(
            children: [
              if (secondaryButtonText != null) ...[
                Expanded(
                  child: _SecondaryButton(
                    text: secondaryButtonText!,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onSecondaryPressed?.call();
                    },
                  ),
                ),
                SizedBox(width: 12.w),
              ],
              Expanded(
                child: _PrimaryButton(
                  text: primaryButtonText ?? 'OK',
                  color: _getMainColor(),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPrimaryPressed?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _PrimaryButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(text, style: TextStyles.font14WhiteSemiBold),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SecondaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.neutralGrey,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        side: BorderSide(color: AppColors.lighterGray, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(text, style: TextStyles.font14BlackMedium),
    );
  }
}
