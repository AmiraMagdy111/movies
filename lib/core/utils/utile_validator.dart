class Validator {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
        return "Name is required";
    }
    if (name.length < 3) {
      return "Name must be at least 3 characters";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return "Name must contain letters only";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "Email is required";
    }
    if (email.contains(' ')) {
      return "Email must not contain spaces";
    }
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null;
  }
  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "password is required";
    }
    if (password.length < 6) {
   return 'Password must be at least 6 characters';
    }
    return null;
  }
  static String? validateConfrimPassword(String? password,String confirmPassword) {
    if (password == null || password.trim().isEmpty) {
      return "Please confirm your password";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }
static String? validatePhone(String?phone){
  if (phone == null || phone.trim().isEmpty) {
    return "Phone number is required";
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
    return "Phone must contain numbers only";
  }
  if (!RegExp(r'^01[0-2,5][0-9]{8}$').hasMatch(phone)) {
    return "Enter a valid Egyptian phone number";
  }
  return null;
}
}