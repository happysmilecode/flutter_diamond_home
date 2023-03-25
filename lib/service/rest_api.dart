import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../constant/constant_string.dart';
import '../model/model_login.dart';
import '../model/model_term_policy.dart';
import '../utils/util_navigation.dart';

class ApiService {
  Future<LoginModel> authService(context, body, apiName) async {
    LoginModel registerData = LoginModel();
    try {
      final response = await http
          .post(Uri.parse(loginApi), body: body)
          .timeout(const Duration(seconds: 15));
      print(response.body);
      registerData = LoginModel.fromJson(jsonDecode(response.body));
    } on SocketException {
      showSnackBar(context, "No Internet connection 😑");
    } on HttpException {
      showSnackBar(context, "Couldn't find the Request 😱");
    } on FormatException {
      showSnackBar(context, "Bad response format 👎");
    } on TimeoutException {
      showSnackBar(context, 'Connection time out ⌚');
    } on Exception {
      showSnackBar(context, "Exception!! Bad response format 👎");
    }
    return registerData;
  }

  Future<TermPolicyModel> termAndPrivacyApi(context, apiName) async {
    TermPolicyModel responseData = TermPolicyModel();
    try {
      final response = await http
          .get(Uri.parse(apiName))
          .timeout(const Duration(seconds: 15));
      responseData = TermPolicyModel.fromJson(jsonDecode(response.body));
    } on SocketException {
      showSnackBar(context, "No Internet connection 😑");
    } on HttpException {
      showSnackBar(context, "Couldn't find the Request 😱");
    } on FormatException {
      showSnackBar(context, "Bad response format 👎");
    } on TimeoutException {
      showSnackBar(context, 'Connection time out ⌚');
    } on Exception {
      showSnackBar(context, "Exception!! Bad response format 👎");
    }
    return responseData;
  }

  Future<Map<String, dynamic>> commonService(context,body,apiName) async {
    print(body.toString());
    Map<String, dynamic>? commonJobData = <String, dynamic>{};
    try {
      final response = await http
          .post(Uri.parse(apiName), body: body)
          .timeout(const Duration(seconds: 15));
      commonJobData = jsonDecode(response.body);
      print(response.body);
    } on SocketException {
      showSnackBar(context, "No Internet connection 😑");
    } on HttpException {
      showSnackBar(context, "Couldn't find the Request 😱");
    } on FormatException {
      showSnackBar(context, "Bad response format 👎");
    } on TimeoutException {
      showSnackBar(context, 'Connection time out ⌚');
    } on Exception {
      showSnackBar(context, "Exception!! Bad response format 👎");
    }
    return commonJobData!;
  }

  Future<LoginModel> profile(
      context, userId, name, email, mobile, imagePath) async {
    final request = http.MultipartRequest('POST', Uri.parse(updateProfileApi));

    if (imagePath != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', imagePath.path));
    }
    request.fields['user_id'] = userId;
    request.fields['fullname'] = name;
    request.fields['mobile'] = mobile;

    http.Response response =
        await http.Response.fromStream(await request.send());

    LoginModel responseData = LoginModel();
    try {
      responseData = LoginModel.fromJson(json.decode(response.body));
    } on SocketException {
      showSnackBar(context, "No Internet connection 😑");
    } on HttpException {
      showSnackBar(context, "Couldn't find the Request 😱");
    } on FormatException {
      showSnackBar(context, "Bad response format 👎");
    } on TimeoutException {
      showSnackBar(context, 'Connection time out ⌚');
    } on Exception {
      showSnackBar(context, "Exception!! Bad response format 👎");
    }

    return responseData;
  }
}
