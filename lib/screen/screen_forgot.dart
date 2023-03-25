import 'package:diamond_homes/Screen/screen_login.dart';


import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../component/widget_button.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';

import '../provider/auth_provider.dart';
import '../utils/util_navigation.dart';
import '../utils/util_validation.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  S txt = S();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
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
                  SizedBox(height: 36),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(36))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24),
                          TextWidget(
                              text: txt.forgotPass,
                              textSize: 28,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: 24),
                          ShowTextWidget(text: txt.email),
                          EditTextItem(
                              textController: emailController,
                              icon: icEmail,
                              errorMsg: ValidationUtils.validateEmail,
                              textInputType: TextInputType.emailAddress,
                              hintText: txt.email),
                          const SizedBox(height: 24),
                          ButtonWidget(
                              textButton: txt.next,
                              textSize: 16.0,
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                              heightButton: 54,
                              borderRadius: 12.0,
                              backgroundColor: blueColor,
                              onPress: () => buttonClick()),
                          const SizedBox(height: 36),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextWidget(
                                text: txt.backToLogin,
                                textSize: 12.0,
                                textDecoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                colorCode: blueColor,
                                press: () => pushReplacementScreen(
                                    context, const LoginScreen())),
                          ),
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

      context.read<AuthProvider>().callForgotPasswordService(
          context, emailController.text);
    }
  }
}
