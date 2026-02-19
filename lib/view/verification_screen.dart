import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/forgot_view_model.dart';
import 'package:coffee_bloom/view/forget_pass_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  String? otpError;
  bool isOtpValid = false;

  bool _validateOtp(String otp) {
    if (otp.isEmpty) {
      setState(() => otpError = 'OTP is required');
      return false;
    }

    if (otp.length != 6) {
      setState(() => otpError = 'OTP must be 6 digits');
      return false;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(otp)) {
      setState(() => otpError = 'OTP must contain only numbers');
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    ImagesPath.verifyCodeImg,
                    height: 110,
                    width: 110,
                    cacheHeight: 220,
                    cacheWidth: 220,
                  ),
                  SizedBox(height: 22),
                  Text(
                    AppConstants.vsVerifyOtpTxt,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppTheme.blackColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    AppConstants.vsEnterCodeTxt,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.greyColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Pinput(
                    length: 6,
                    controller: otpController,
                    mainAxisAlignment: MainAxisAlignment.center,

                    onChanged: (value) {
                      setState(() {
                        otpError = null;
                        isOtpValid = false;
                      });
                    },

                    onCompleted: (pin) {
                      if (_validateOtp(pin)) {
                        setState(() {
                          isOtpValid = true;
                          otpError = null;
                        });
                      }
                    },

                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppTheme.primaryColor),
                      decoration: BoxDecoration(
                        color: AppTheme.greyColor.withAlpha(60),
                        border: Border.all(color: AppTheme.greyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    focusedPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppTheme.primaryColor),
                      decoration: BoxDecoration(
                        color: AppTheme.greyColor.withAlpha(60),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    errorPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.errorColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),
                  if (otpError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        otpError!,
                        style: const TextStyle(color: AppTheme.errorColor, fontSize: 12),
                      ),
                    ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.vsDidntGetTxt,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Consumer<ForgotViewModel>(
                        builder: (context, forgotVM, _) {
                          return TextButton(
                            onPressed: forgotVM.isLoading
                                ? null
                                : () async {
                              final data = {
                                'email': widget.email,
                              };
                                    await forgotVM.sendEmail(data: data);
                                    
                                    final currentContext = context;
                                    if (!currentContext.mounted) return;
                                    
                                    if (forgotVM.forgetResponse != null) {
                                      ScaffoldMessenger.of(currentContext).showSnackBar(
                                        const SnackBar(
                                          content: Text(AppConstants.seVerCodeResentTxt),
                                          backgroundColor: AppTheme.successColor,
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      final errorMessage =
                                          forgotVM.error ?? 'Failed to resend code';
                                      
                                      ScaffoldMessenger.of(currentContext).showSnackBar(
                                        SnackBar(
                                          content: Text(errorMessage),
                                          backgroundColor: AppTheme.errorColor,
                                          behavior: SnackBarBehavior.floating,
                                          duration: const Duration(seconds: 3),
                                        ),
                                      );
                                    }
                                  },
                            child: forgotVM.isLoading
                                ? const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.greyColor),
                                    ),
                                  )
                                : Text(
                                    AppConstants.vsResendCodeTxt,
                                    style: Theme.of(context).textTheme.bodySmall!
                                        .copyWith(color: AppTheme.primaryColor),
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Consumer<ForgotViewModel>(
                    builder: (context, forgotVM, _) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: forgotVM.isLoading
                              ? null
                              : () async {
                                  final otp = otpController.text.trim();
                                  
                                  if (!_validateOtp(otp)) {
                                    return;
                                  }

                                  final data = {
                                    'email': widget.email,
                                    'otp': otp,
                                  };

                                  await forgotVM.verifyOtp(
                                  data: data
                                  );

                                  if (!mounted) return;

                                  final currentContext = context;
                                  if (!currentContext.mounted) return;

                                  if (forgotVM.verifyResponse != null) {
                                    ScaffoldMessenger.of(currentContext).showSnackBar(
                                      const SnackBar(
                                        content: Text('OTP verified successfully'),
                                        backgroundColor: AppTheme.successColor,
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      currentContext,
                                      MaterialPageRoute(
                                        builder: (context) => ForgetPassScreen(
                                          email: widget.email,
                                        ),
                                      ),
                                    );
                                  } else {
                                    final errorMessage =
                                        forgotVM.error ?? 'Invalid OTP';

                                    ScaffoldMessenger.of(currentContext).showSnackBar(
                                      SnackBar(
                                        content: Text(errorMessage),
                                        backgroundColor: AppTheme.errorColor,
                                        behavior: SnackBarBehavior.floating,
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: forgotVM.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.secColor),
                                    ),
                                  )
                                : Text(
                                    AppConstants.msContinueTxt,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
