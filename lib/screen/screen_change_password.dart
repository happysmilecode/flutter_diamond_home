
import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../component/widget_button.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';
import '../provider/auth_provider.dart';
import '../utils/util_common_method.dart';
import '../utils/util_validation.dart';
import 'screen_login.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  S txt = S();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return LoadingOverlay(
            isLoading: provider.isLoading,
            opacity: 0.3,
            color: Colors.grey,
            progressIndicator: const CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(colorPrimary)),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Image.asset(appLogo, scale: 2),
                    SizedBox(height: 16),
                    Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(size.height * .040),
                      decoration: createDecoration(greyColor,
                          isTopRadius: true, radius: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          TextWidget(
                              text: txt.changePassword,
                              textSize: 22,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: size.height * .040),
                          ShowTextWidget(text: txt.currentPassword),
                          EditTextItem(
                              textController: passwordController,
                              errorMsg: ValidationUtils.validatePassword,
                              isPassword: true,
                              maxLine: 1,
                              textInputType: TextInputType.text,
                              hintText: "******"),
                          SizedBox(height: size.height * .02),
                          ShowTextWidget(text: txt.newPassword),
                          EditTextItem(
                              textController: newPasswordController,
                              errorMsg: ValidationUtils.validateNewPassword,
                              icon: provider.showPassword
                                  ? icHidePassword
                                  : icShowPassword,
                              isPassword: provider.showPassword,
                              maxLine: 1,
                              iconClick: () => provider.isShowPasswordClick(),
                              textInputType: TextInputType.text,
                              hintText: "******"),
                          SizedBox(height: size.height * .02),
                          ShowTextWidget(text: txt.confirmPassword),
                          EditTextItem(
                              textController: conPasswordController,
                              errorMsg: ValidationUtils.validateConfirmPassword,
                              icon: provider.showConPassword
                                  ? icHidePassword
                                  : icShowPassword,
                              isPassword: provider.showConPassword,
                              maxLine: 1,
                              iconClick: () =>
                                  provider.isShowConPasswordClick(),
                              textInputType: TextInputType.text,
                              hintText: "******"),
                          SizedBox(height: size.height * .080),
                          ButtonWidget(
                              textButton: txt.done,
                              textSize: 16.0,
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                              heightButton: 54,
                              borderRadius: 12.0,
                              backgroundColor: blueColor,
                              onPress: () => buttonClick()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buttonClick() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      /*context.read<AuthProvider>().callLoginService(
          context, emailController.text, passwordController.text, "token");*/
    }
  }
}
