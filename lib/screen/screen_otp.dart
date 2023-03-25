import 'package:diamond_homes/screen/screen_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import '../../component/widget_text_field.dart';
import '../../component/widget_otp.dart';
import '../../constant/constant_color.dart';
import '../../utils/util_navigation.dart';
import '../component/widget_button.dart';
import '../constant/constant_icon.dart';
import '../generated/l10n.dart';
import '../provider/auth_provider.dart';
import '../utils/util_common_method.dart';

class OtpScreen extends StatefulWidget {
  final String? email;
  final String? otp;

  const OtpScreen({Key? key, this.email, this.otp}) : super(key: key);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? et1, et2, et3, et4;
  S txt = S();

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
                      padding: const EdgeInsets.all(20),
                      decoration: createDecoration(greyColor,
                          isTopRadius: true, radius: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * .040),
                          TextWidget(
                              text: txt.otp,
                              textSize: 24,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: size.height * .040),
                          ShowTextWidget(text: txt.enterOtp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OTPWidget(
                                  first: true,
                                  last: false,
                                  borderRadius: 16,
                                  backgroundColor: Colors.white,
                                  getText: (String val) =>
                                      setState(() => et1 = val)),
                              const SizedBox(width: 16),
                              OTPWidget(
                                  first: false,
                                  last: false,
                                  borderRadius: 16,
                                  backgroundColor: Colors.white,
                                  getText: (String val) =>
                                      setState(() => et2 = val)),
                              const SizedBox(width: 16),
                              OTPWidget(
                                  first: false,
                                  last: false,
                                  backgroundColor: Colors.white,
                                  borderRadius: 16,
                                  getText: (String val) =>
                                      setState(() => et3 = val)),
                              const SizedBox(width: 16),
                              OTPWidget(
                                  first: false,
                                  last: true,
                                  borderRadius: 16,
                                  backgroundColor: Colors.white,
                                  getText: (String val) =>
                                      setState(() => et4 = val)),
                            ],
                          ),
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

  void buttonClick() {
    formKey.currentState!.save();
    String otpCode = et1! + et2! + et3! + et4!;
 //   print("${otpCode != widget.otp}-== $otpCode -=- ${widget.otp}");
    if (et1!.isEmpty || et2!.isEmpty || et3!.isEmpty || et4!.isEmpty) {
      showSnackBar(context, txt.enterValidOTP);
    } else if (otpCode != widget.otp) {
      showSnackBar(context, txt.invalidOTP);
    } else {
      pushReplacementScreen(context, ResetPasswordScreen());
    }
  }
}

class ShowTextWidget extends StatelessWidget {
  final String? text;

  const ShowTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextWidget(
          text: text,
          textSize: 12.0,
          fontWeight: FontWeight.w600,
          colorCode: textColor),
    );
  }
}
