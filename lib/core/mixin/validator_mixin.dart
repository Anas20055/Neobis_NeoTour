mixin CustomTextFieldValidator {
  String? validateNumber(String? value) {
    if (value?.isEmpty == true) {
      return 'Field cannot be empty';
    } else if (value!.length != 9) {
      return 'Number must be 9 characters long';
    } else if (double.tryParse(value) == null) {
      return 'Invalid number';
    }
    return null; // Return null if validation succeeds
  }

  String? validateNotEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Field cannot be empty';
    }
    return null; // Return null if validation succeeds
  }
}
