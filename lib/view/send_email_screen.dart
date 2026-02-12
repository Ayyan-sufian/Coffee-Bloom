import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/forgot_view_model.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool error = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppConstants.lsForgetTxt,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: AppTheme.blackColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                AppConstants.seContentTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.primaryColor.withAlpha(40),
                child: Icon(
                  Icons.lock_reset,
                  color: AppTheme.primaryColor,
                  size: 50,
                ),
              ),
              SizedBox(height: 50),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppConstants.ssAllErrorTxt;
                    }
                    return null;
                  },
                  style: TextStyle(color: AppTheme.primaryColor),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppTheme.primaryColor,
                    ),
                    hintText: AppConstants.ssEmailTxt,
                    hintStyle: TextStyle(color: AppTheme.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Consumer<ForgotViewModel>(
                builder: (context, forgotVM, _) {
                  return SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: forgotVM.isLoading
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              
                              final email = emailController.text.trim();
                              if (!email.contains('@')) {
                                _showToast(context, 'Please enter a valid email');
                                return;
                              }
                              
                              final success = await forgotVM.sendEmail(email);

                              final currentContext = context;
                              if (!currentContext.mounted) return;

                              if (success) {
                                ScaffoldMessenger.of(currentContext).showSnackBar(
                                  SnackBar(
                                    content: const Text('Verification code sent successfully'),
                                    backgroundColor: AppTheme.successColor,
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                                Navigator.push(
                                  currentContext,
                                  MaterialPageRoute(
                                    builder: (_) => VerificationScreen(email: email),
                                  ),
                                );
                              } else {
                                final errorMessage =
                                    forgotVM.error ?? 'Failed to send email';

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
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.secColor),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send,
                                    color: AppTheme.secColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppConstants.seSendTxt,
                                    style: Theme.of(context).textTheme.bodyLarge!
                                        .copyWith(color: AppTheme.secColor),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    AppConstants.seRememberTxt,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppConstants.ssLogInTxt,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
