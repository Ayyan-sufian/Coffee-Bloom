import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/home_page_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height - 80),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        AppConstants.vsVerifyNumTxt,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: AppTheme.blackColor),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                  SizedBox(height: 35),
                  Image.asset(ImagesPath.verifyCodeImg, height: 110, width: 110),
                  SizedBox(height: 16),
                  Text(
                    AppConstants.vsEnterCodeTxt,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                  ),
                  SizedBox(height: 22,),
                  OtpTextField(
                    fieldHeight: 50,
                    fieldWidth: 50,
                    numberOfFields: 4,
                    cursorColor: AppTheme.primaryColor,
                    showFieldAsBox: true,
                    focusedBorderColor: AppTheme.primaryColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.primaryColor),
                    filled: true,
                    fillColor: AppTheme.greyColor.withAlpha(60),
                    onSubmit: (String verificationCode) {
                      print("OTP Entered: $verificationCode");
                    },
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppConstants.vsDidntGetTxt,style: Theme.of(context).textTheme.bodySmall,),
                      TextButton(onPressed: () {},child: Text(AppConstants.vsResendCodeTxt,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppTheme.primaryColor),))
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen(),));
                    }, child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(AppConstants.msContinueTxt,style: Theme.of(context).textTheme.headlineSmall,),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
