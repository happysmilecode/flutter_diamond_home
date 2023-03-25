import 'package:diamond_homes/constant/constant_color.dart';
import 'package:diamond_homes/generated/l10n.dart';
import 'package:diamond_homes/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../component/widget_button.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_icon.dart';
import '../utils/util_common_method.dart';
import '../utils/util_validation.dart';
import 'screen_login.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  S txt = S();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 48),
                  Image.asset(appLogo, scale: 2),
                  SizedBox(height: 32),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(24),
                      decoration: createDecoration(greyColor,
                          isTopRadius: true, radius: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * .040),
                          TextWidget(
                              text: txt.resetPassword,
                              textSize: 24,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: size.height * .040),
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
                  ),
                ],
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
