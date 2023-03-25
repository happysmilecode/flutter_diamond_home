import 'dart:convert';

import 'package:flutter/material.dart';

import '../constant/constant_string.dart';
import '../model/model_request_signup.dart';
import '../screen/screen_dashboard.dart';
import '../screen/screen_otp.dart';
import '../service/rest_api.dart';
import '../utils/util_navigation.dart';
import '../utils/util_shared_preference.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false, showPassword = true, showConPassword = true;

  isShowPasswordClick() {
    showPassword = !showPassword;
    notifyListeners();
  }

  isShowConPasswordClick() {
    showConPassword = !showConPassword;
    notifyListeners();
  }

  void callLoginService(context, email, password, token) async {
    showLoader();

    final body = {"email": email, "password": password, "token": token};
    var loginRes = await ApiService().authService(context, body, loginApi);

    showLoader();
    handleResponse(context, loginRes);
  }

  void callSignupService(context, RequestSignupModel model) async {
    showLoader();

    final body = {
      "title": model.title,
      "user_name": model.userName,
      "first_name": model.firstName,
      "last_name": model.lastName,
      "email": model.email,
      "phone": model.phone,
      "password": model.password,
      "city": model.city,
      "language": model.language,
      "country": model.country,
      "address": model.address,
      "idr_number": model.idrNumber
    };
    var signupRes = await ApiService().authService(context, body, signupApi);

    showLoader();
    handleResponse(context, signupRes);
  }

  handleResponse(context, signupRes) {
    pushAndRemoveUntilScreen(context, const DashboardScreen());

    // if (signupRes.status!) {
    //   SharedPreferenceUtils.putBoolean(isLogin, true);
    //   SharedPreferenceUtils.putString(userId, signupRes.data!.id!);
    //   SharedPreferenceUtils.putString(userData, json.encode(signupRes.data));
    //   pushAndRemoveUntilScreen(context, const DashboardScreen());
    // } else {
    //   showSnackBar(context, signupRes.message!);
    // }
    notifyListeners();
  }

  void callForgotPasswordService(context, emailId) async {
    showLoader();
    final body = {"email": emailId};

    var forgotRes =
        await ApiService().commonService(context, body, forgotPasswordApi);

    showLoader();
    showSnackBar(context, forgotRes["message"]);
    if (forgotRes["status"]) {
      pushScreen(context, OtpScreen(email: emailId,otp: forgotRes["otp"].toString()));
    }
    notifyListeners();
  }

  showLoader() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
