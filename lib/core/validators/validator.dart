class Validator {
  static String? emailValidator(String? value) {
    if (value == null || value == "") {
      return "Email can't be empty";
    }
    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!isValidEmail) {
      return "Email invalid";
    }
    return null;
  }

  static String? min(String? value, {int min = 1, String name = "This value"}) {
    if (value == null || value == "") {
      return "$name can't be empty";
    }
    if (value.length < min && min == 1) {
      return "$name is required";
    }
    if (value.length < min) {
      return "$name must more than $min";
    }
    return null;
  }
}
