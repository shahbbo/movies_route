class ValidateOfTextfiled {
  ValidateOfTextfiled();
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email please';

    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    return RegExp(pattern).hasMatch(value) ? null : 'Invalid email';
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return 'this field is required';
    } else if (val.isEmpty) {
      return 'this field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return 'same password';
    } else {
      return null;
    }
  }

  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name.";
    } else if (value.trim().length < 3) {
      return "Name must be at least 3 characters long.";
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Name can only contain letters and spaces.";
    }
    return null;
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    final RegExp phoneRegExp = RegExp(r'^\+20(10|11|12|15)\d{8}$');

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Please enter your phone number.";
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      return "Invalid phone number format. Use +201XXXXXXXXX.";
    }
    return null; // Valid case
  }

  static String? validateSelectedImage(int? selectedImage) {
    if (selectedImage == null || selectedImage.isNegative) {
      return "Please select a profile image.";
    }
    return null;
  }
}
