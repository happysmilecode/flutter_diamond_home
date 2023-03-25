class ValidationUtils {
  static const String namePattern = r'(^[a-zA-Z ]*$)';
  static const String usernamePattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
  static const String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordPattern =
      r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
  static const String passwordSixDigit = r'^.{6,30}$';
  static const String mobilePattern = r'(^[0-9]*$)';
  static const String cardDatePattern = ("(?:0[1-9]|1[0-2])/[0-9]{2}");

  static String firstNameRequired = "First name is required";

  static String nameRequired = "Name is required";

  static String lastNameRequired = "Last name is required";

  static String userNameRequired = "User name is required";

  static String userFourCharacter = "Username must be more than 3 character";

  static String nameFourCharacter = "Name must be more than 3 character";

  static String lastNameFourCharacter =
      "Last name must be more than 3 character";

  static String nameMustAlphabetical = "Name must be a-z and A-Z";

  static String lastNameMustAlphabetical = "Last name must be a-z and A-Z";

  static String usernameMustLetterNumber =
      "Username can only use letters,numbers";

  static String fieldRequired = "This field is Required";

  static String fieldFavRequired = "Favorite field is Required";

  static String invalidUsername = "Invalid username";

  static String enterHere = "Enter here";

  static String enterLocation = "Location is required";

  static String enterCity = "City is required";

  static String enterState = "State is required";

  static String enterAddress = "Address is required";

  static String enterCardNumber = "Card number is required";

  static String enterHolderName = "Holder name is required";

  static String enterExpiryDate = "Expiry date is required";

  static String enterCVV = "CVV is required";

  static String enterZipCode = "Zip code is required";

  static String mobileRequired = "Mobile is required";

  static String mobileTenDigit = "Mobile number must 10 digits";

  static String mobileMustDigit = "Mobile Number must be digits";

  static String emailRequired = "Email is required";

  static String invalidEmail = "Invalid email";

  static String enterValidOTP = "Please enter valid OTP";

  static String invalidOTP = "Invalid OTP";

  static String invalidPassword = "Invalid password";

  static String invalidNewPassword = "Invalid new password";

  static String invalidConfirmPassword = "Invalid confirm password";

  static String notMatchPassword =
      "New password and confirm password Not match";

  static String passwordRequired = "Password is required";

  static String oldPasswordRequired = "Old password is required";

  static String newPasswordRequired = "New password is required";

  static String confirmPasswordRequired = "Confirm password is required";

  static String passwordSixCharacter = "Password must be more than 4 character";

  static String? validateFirstName(context, String value) {
    RegExp regExp = RegExp(namePattern);
    if (value.isEmpty) {
      return firstNameRequired;
    } else if (value.length < 4) {
      return nameFourCharacter;
    } else if (!regExp.hasMatch(value)) {
      return nameMustAlphabetical;
    }
    return null;
  }

  static String? validateName(context, String value) {
    RegExp regExp = RegExp(namePattern);
    if (value.isEmpty) {
      return nameRequired;
    }
    /*else if (value.length < 4) {
      return nameFourCharacter;
    }*/
    else if (!regExp.hasMatch(value)) {
      return nameMustAlphabetical;
    }
    return null;
  }

  static String? validateLastName(context, String value) {
    RegExp regExp = RegExp(namePattern);
    if (value.isEmpty) {
      return lastNameRequired;
    } else if (value.length < 4) {
      return lastNameFourCharacter;
    } else if (!regExp.hasMatch(value)) {
      return lastNameMustAlphabetical;
    }
    return null;
  }

  static String? validateUserName(context, String value) {
    RegExp regExp = RegExp(usernamePattern);
    if (value.isEmpty) {
      return userNameRequired;
    } else if (value.length < 4) {
      return userFourCharacter;
    } else if (!regExp.hasMatch(value)) {
      return usernameMustLetterNumber;
    }
    return null;
  }

  static String? validateMobile(context, String value) {
    RegExp regExp = RegExp(mobilePattern);
    if (value.isEmpty) {
      return mobileRequired;
    } else if (value.length != 10) {
      return mobileTenDigit;
    } else if (!regExp.hasMatch(value)) {
      return mobileMustDigit;
    }
    return null;
  }

  static String? validateEmail(context, String value) {
    RegExp regExp = RegExp(emailPattern);
    if (value.isEmpty) {
      return emailRequired;
    } else if (!regExp.hasMatch(value)) {
      return invalidEmail;
    }
    return null;
  }

  static String? validatePassword(context, String value) {
    if (value.isEmpty) {
      return passwordRequired;
    } else if (value.length < 4) {
      return passwordSixCharacter;
    }
    return null;
  }

  static String? validateNewPassword(context, String value) {
    if (value.isEmpty) {
      return newPasswordRequired;
    } else if (value.length < 4) {
      return passwordSixCharacter;
    }
    return null;
  }

  static String? validateConfirmPassword(context, String value) {
    if (value.isEmpty) {
      return confirmPasswordRequired;
    }
    return null;
  }

  static String? validateOldPassword(context, String value) {
    if (value.isEmpty) {
      return oldPasswordRequired;
    }
    return null;
  }

  static String? validateLocation(context, String value) {
    if (value.isEmpty) {
      return enterLocation;
    }
    return null;
  }

  static String? validateCity(context, String value) {
    if (value.isEmpty) {
      return enterCity;
    }
    return null;
  }

  static String? validateState(context, String value) {
    if (value.isEmpty) {
      return enterState;
    }
    return null;
  }

  static String? validateAddress(context, String value) {
    if (value.isEmpty) {
      return enterAddress;
    }
    return null;
  }

  static String? validateCardNUm(context, String value) {
    if (value.isEmpty) {
      return enterCardNumber;
    }
    return null;
  }

  static String? validateCardHolderName(context, String value) {
    if (value.isEmpty) {
      return enterHolderName;
    }
    return null;
  }

  static String? validateCardExpiry(context, String value) {
    if (value.isEmpty) {
      return enterExpiryDate;
    }
    return null;
  }

  static String? validateCVV(context, String value) {
    if (value.isEmpty) {
      return enterCVV;
    }
    return null;
  }

  static String? validateZipCode(context, String value) {
    if (value.isEmpty) {
      return enterZipCode;
    }
    return null;
  }

  static String? validateFiled(context, String value) {
    if (value.isEmpty) {
      return fieldRequired;
    }
    return null;
  }
}
