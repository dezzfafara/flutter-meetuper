emailValidator(String value, String field) {
  final regEx = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final res = regEx.hasMatch(value);
  return res ? null : 'Please provide valid email!';
}

requiredValidator(String value, String field) {
  if (value.isEmpty) {
    return 'Please enter $field!';
  }
  return null;
}

minLengthValidator(String value, String field) {
  if (value.length < 8) {
    return 'Please enter at least 8 characters for $field!';
  }
  return null;
}

Function(String) composeValidators(String field, List<Function> validators) {
  return (v) {
    if (validators != null && validators is List && validators.isNotEmpty) {
      for (var validator in validators) {
        final String errorMessage = validator(v, field);
        if (errorMessage != null) {
          return errorMessage;
        }
      }
    }
    return null;
  };
}
