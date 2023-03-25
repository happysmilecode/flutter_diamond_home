import 'package:diamond_homes/Screen/screen_forgot.dart';
import 'package:diamond_homes/Screen/screen_signup.dart';
import 'package:diamond_homes/component/widget_text_field.dart';
import 'package:diamond_homes/generated/l10n.dart';
import 'package:diamond_homes/provider/auth_provider.dart';
import 'package:diamond_homes/screen/screen_change_password.dart';
import 'package:diamond_homes/screen/screen_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import '../component/widget_button.dart';
import '../component/widget_edit_text.dart';
import '../component/widget_rich_text.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';
import '../utils/util_navigation.dart';
import '../utils/util_validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  S txt = S();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 48),
                    Image.asset(appLogo, scale: 2),
                    SizedBox(height: 36),
                    Container(
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
                              text: txt.login,
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
                          SizedBox(height: 24),
                          ShowTextWidget(text: txt.password),
                          EditTextItem(
                              textController: passwordController,
                              errorMsg: ValidationUtils.validatePassword,
                              icon: provider.showPassword
                                  ? icHidePassword
                                  : icShowPassword,
                              isPassword: provider.showPassword,
                              maxLine: 1,
                              iconClick: () => provider.isShowPasswordClick(),
                              textInputType: TextInputType.text,
                              hintText: txt.password),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextWidget(
                                text: txt.forgotPass,
                                textSize: 12.0,
                                textDecoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                colorCode: blueColor,
                                press: () => pushScreen(
                                    context, const ForgotPassScreen())),
                          ),
                          const SizedBox(height: 24),
                          ButtonWidget(
                              textButton: txt.login,
                              textSize: 16.0,
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                              heightButton: 54,
                              borderRadius: 12.0,
                              backgroundColor: blueColor,
                              onPress: () => buttonClick()),
                          const SizedBox(height: 36),
                          RichTextWidget(
                              textSpanModel: setRichText(),
                              textAlignment: TextAlign.center,
                              alignment: Alignment.topCenter),
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

  List<RichTextModel> setRichText() {
    List<RichTextModel> richTextModel = [];
    richTextModel.add(RichTextModel("${txt.noAccount} ", 12.0, FontWeight.w500,
        textColor, false, null, () {}));
    richTextModel.add(RichTextModel(
        txt.signUp,
        14.0,
        FontWeight.bold,
        textColor,
        false,
        null,
        () => pushScreen(context, const SignUpScreen())));

    return richTextModel;
  }

  buttonClick() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      context.read<AuthProvider>().callLoginService(
          context, emailController.text, passwordController.text, "token");
    }
  }
}

class ShowTextWidget extends StatelessWidget {
  final String? text;

  const ShowTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: TextWidget(
          text: text,
          textSize: 12.0,
          fontWeight: FontWeight.w600,
          colorCode: textColor),
    );
  }
}

class EditTextItem extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final String? icon;
  final int? maxWord, maxLine;
  final TextInputType? textInputType;
  final bool? isPassword;
  final Function? errorMsg;
  final GestureTapCallback? iconClick;

  const EditTextItem(
      {Key? key,
      this.hintText,
      this.icon,
      this.maxWord,
      this.maxLine,
      this.textInputType,
      this.isPassword,
      this.textController,
      this.iconClick,
      this.errorMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditTextWidget(
        getTextController: textController!,
        hintText: hintText,
        isPassword: isPassword ?? false,
        textSize: 14,
        textColor: Colors.black,
        fontWeight: FontWeight.w500,
        hintFontWeight: FontWeight.w400,
        hintTextColor: Colors.grey,
        borderRadius: 8.0,
        maxLength: maxWord,
        iconClick: iconClick,
        maxLine: maxLine,
        horizontalPadding: 12,
        errorMsg: errorMsg,
        focusedBorderColor: colorPrimary,
        backgroundColor: Colors.white,
        suffixImageName: icon,
        textInputType: textInputType);
  }
}
