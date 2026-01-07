class Validator {
  static Validator instance = Validator._internal();
  Validator._internal();

  String? emailValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value!)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? emptyValidator(String? value) {
    value == null ? value = "" : value = value;
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 8 || value.length > 15) {
      return "Please enter a valid mobile number";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Please enter a valid mobile number";
    }
    return null;
  }

  validateName(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (text!.length < 2) {
      return "Name must be at least 2 characters";
    }
    return null;
  }

  String? validatePercentage(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (double.parse(value!) > 100) {
      return "Please enter a valid percentage";
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (double.tryParse(value!) == null) {
      return "Please enter a valid number";
    } else if (double.parse(value) < 0) {
      return "Please enter a valid number";
    }
    return null;
  }
}
