import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import '../component/widget_button.dart';
import '../component/widget_rich_text.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';
import '../model/model_request_signup.dart';
import '../provider/auth_provider.dart';
import '../utils/util_navigation.dart';
import '../utils/util_validation.dart';
import 'screen_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  S txt = S();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController irdNumberController = TextEditingController();

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
                    SizedBox(height: 36),
                    Image.asset(appLogo, scale: 2),
                    SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
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
                              text: txt.signUp,
                              textSize: 28,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: 24),
                          Row(children: [
                            Expanded(child: ShowTextWidget(text: txt.title)),
                            SizedBox(width: 8),
                            Expanded(child: ShowTextWidget(text: txt.userName)),
                          ]),
                          Row(children: [
                            Expanded(
                              child: EditTextItem(
                                  textController: titleController,
                                  errorMsg: ValidationUtils.validateFiled,
                                  textInputType: TextInputType.text,
                                  hintText: txt.title),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: EditTextItem(
                                  textController: userNameController,
                                  errorMsg: ValidationUtils.validateUserName,
                                  textInputType: TextInputType.name,
                                  hintText: txt.userName),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Row(children: [
                            Expanded(
                                child: ShowTextWidget(text: txt.firstName)),
                            SizedBox(width: 8),
                            Expanded(child: ShowTextWidget(text: txt.lastName)),
                          ]),
                          Row(children: [
                            Expanded(
                              child: EditTextItem(
                                  textController: firstNameController,
                                  errorMsg: ValidationUtils.validateFirstName,
                                  textInputType: TextInputType.name,
                                  hintText: txt.firstName),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: EditTextItem(
                                  textController: lastNameController,
                                  errorMsg: ValidationUtils.validateLastName,
                                  textInputType: TextInputType.name,
                                  hintText: txt.lastName),
                            ),
                          ]),
                          SizedBox(height: 20),
                          ShowTextWidget(text: txt.email),
                          EditTextItem(
                              textController: emailController,
                              errorMsg: ValidationUtils.validateEmail,
                              textInputType: TextInputType.emailAddress,
                              hintText: txt.email),
                          SizedBox(height: 20),
                          ShowTextWidget(text: txt.phoneNo),
                          EditTextItem(
                              textController: phoneController,
                              errorMsg: ValidationUtils.validateMobile,
                              textInputType: TextInputType.phone,
                              hintText: txt.phoneNo),
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          ShowTextWidget(text: txt.irdNumber),
                          EditTextItem(
                              textController: irdNumberController,
                              errorMsg: ValidationUtils.validateFiled,
                              textInputType: TextInputType.number,
                              hintText: txt.irdNumber),
                          SizedBox(height: 20),
                          ShowTextWidget(text: txt.address),
                          EditTextItem(
                              textController: addressController,
                              errorMsg: ValidationUtils.validateAddress,
                              textInputType: TextInputType.text,
                              hintText: txt.address),
                          SizedBox(height: 20),
                          ShowTextWidget(text: txt.city),
                          EditTextItem(
                              textController: cityController,
                              errorMsg: ValidationUtils.validateCity,
                              textInputType: TextInputType.text,
                              hintText: txt.city),
                          SizedBox(height: 20),
                          Row(children: [
                            Expanded(child: ShowTextWidget(text: txt.country)),
                            SizedBox(width: 8),
                            Expanded(child: ShowTextWidget(text: txt.language)),
                          ]),
                          Row(children: [
                            Expanded(
                              child: EditTextItem(
                                  textController: countryController,
                                  errorMsg: ValidationUtils.validateFiled,
                                  textInputType: TextInputType.text,
                                  hintText: txt.country),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: EditTextItem(
                                  textController: languageController,
                                  errorMsg: ValidationUtils.validateFiled,
                                  textInputType: TextInputType.text,
                                  hintText: txt.language),
                            ),
                          ]),
                          const SizedBox(height: 24),
                          ButtonWidget(
                              textButton: txt.signUp,
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
    richTextModel.add(RichTextModel("${txt.alreadyAccount} ", 12.0,
        FontWeight.w500, textColor, false, null, () {}));
    richTextModel.add(RichTextModel(txt.login, 14.0, FontWeight.bold, textColor,
        false, null, () => pushScreen(context, const LoginScreen())));

    return richTextModel;
  }

  buttonClick() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      context.read<AuthProvider>().callSignupService(
          context,
          RequestSignupModel(
              title: titleController.text,
              userName: userNameController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              email: emailController.text,
              phone: phoneController.text,
              password: passwordController.text,
              city: cityController.text,
              language: languageController.text,
              country: countryController.text,
              address: addressController.text,
              idrNumber: irdNumberController.text));
    }
  }
}
