class AppValidator {
  /// -----------------------------
  /// Validate Email
  /// -----------------------------
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Strong Password
  /// -----------------------------
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }

    final validations = getPasswordValidations(value);
    final allValid = validations.every((v) => v.isValid);

    if (!allValid) {
      return "";
    }

    return null;
  }

  /// -----------------------------
  /// Get Password Validations Status
  /// -----------------------------
  static List<PasswordValidation> getPasswordValidations(String password) {
    return [
      PasswordValidation(
        label: "At least 8 characters",
        isValid: password.length >= 8,
      ),
      PasswordValidation(
        label: "One uppercase letter (A-Z)",
        isValid: RegExp(r'[A-Z]').hasMatch(password),
      ),
      PasswordValidation(
        label: "One lowercase letter (a-z)",
        isValid: RegExp(r'[a-z]').hasMatch(password),
      ),
      PasswordValidation(
        label: "One number (0-9)",
        isValid: RegExp(r'\d').hasMatch(password),
      ),
      PasswordValidation(
        label: "One special character (!@#\$%^&*)",
        isValid: RegExp(r'[!@#\$&*~%^()\-\_=+{};:,<.>/?]').hasMatch(password),
      ),
    ];
  }

  /// -----------------------------
  /// Validate Name
  /// -----------------------------
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }

    if (value.trim().length < 2) {
      return "Name must be at least 2 characters";
    }

    if (value.trim().length > 50) {
      return "Name must not exceed 50 characters";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Phone Number
  /// -----------------------------
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }

    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');

    if (!phoneRegex.hasMatch(value.trim().replaceAll(RegExp(r'[\s-]'), ''))) {
      return "Enter a valid phone number";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Confirm Password
  /// -----------------------------
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return "Confirm password is required";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Required Field
  /// -----------------------------
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return "${fieldName ?? 'This field'} is required";
    }
    return null;
  }

  /// -----------------------------
  /// Validate Minimum Length
  /// -----------------------------
  static String? validateMinLength(
    String? value,
    int minLength, {
    String? fieldName,
  }) {
    if (value == null || value.trim().isEmpty) {
      return "${fieldName ?? 'This field'} is required";
    }

    if (value.trim().length < minLength) {
      return "${fieldName ?? 'This field'} must be at least $minLength characters";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Maximum Length
  /// -----------------------------
  static String? validateMaxLength(
    String? value,
    int maxLength, {
    String? fieldName,
  }) {
    if (value != null && value.trim().length > maxLength) {
      return "${fieldName ?? 'This field'} must not exceed $maxLength characters";
    }
    return null;
  }

  /// -----------------------------
  /// Validate Number
  /// -----------------------------
  static String? validateNumber(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return "${fieldName ?? 'This field'} is required";
    }

    if (double.tryParse(value.trim()) == null) {
      return "Enter a valid number";
    }

    return null;
  }

  /// -----------------------------
  /// Validate URL
  /// -----------------------------
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "URL is required";
    }

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value.trim())) {
      return "Enter a valid URL";
    }

    return null;
  }

  /// -----------------------------
  /// Validate Age
  /// -----------------------------
  static String? validateAge(String? value, {int minAge = 0, int? maxAge}) {
    if (value == null || value.trim().isEmpty) {
      return "Age is required";
    }

    final age = int.tryParse(value.trim());

    if (age == null) {
      return "Enter a valid age";
    }

    if (age < minAge) {
      return "Age must be at least $minAge";
    }

    if (maxAge != null && age > maxAge) {
      return "Age must not exceed $maxAge";
    }

    return null;
  }
}

/// -----------------------------
/// Password Validation Model
/// -----------------------------
class PasswordValidation {
  final String label;
  final bool isValid;

  PasswordValidation({required this.label, required this.isValid});
}
