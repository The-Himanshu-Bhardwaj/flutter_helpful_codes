bool isMobileNumberValid(String mobileNumber) {
  // Check if the mobile number is not empty
  if (mobileNumber.isEmpty) {
    return false;
  }

  // Check if the mobile number has 10 digits
  if (mobileNumber.length < 10 ) {
    return false;
  }

  // Check if all digits are the same
  bool allDigitsSame = true;
  for (int i = 0; i < mobileNumber.length - 1; i++) {
    if (mobileNumber[i] != mobileNumber[i + 1]) {
      allDigitsSame = false;
      break;
    }
  }
  if (allDigitsSame) {
    return false;
  }


  // Check if the mobile number is not all zeros
  if (int.tryParse(mobileNumber) == 0) {
    return false;
  }

  // All validations passed, mobile number is valid
  return true;
}