// EMAIL FORMAT VALIDATOR
bool isValidEmail(String email) {
  // Regular expression pattern for email validation
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );
  return emailRegex.hasMatch(email);
}