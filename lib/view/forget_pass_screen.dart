import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/forgot_view_model.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassScreen extends StatefulWidget {
  final String email;
  const ForgetPassScreen({super.key, required this.email});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool isVisible1 = true;
  bool isVisible2 = true;

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppConstants.fpCreateTxt,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: AppTheme.blackColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.primaryColor.withAlpha(40),
                child: Icon(
                  Icons.password,
                  color: AppTheme.primaryColor,
                  size: 50,
                ),
              ),
              SizedBox(height: 40),
              Text(
                AppConstants.fpTitleTxt,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: AppTheme.blackColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                AppConstants.fpContentTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppConstants.fpEnterNewPassTxt),
                    TextFormField(
                      controller: passController,
                      obscureText: isVisible1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppConstants.ssAllErrorTxt;
                        }
                        return null;
                      },
                      style: TextStyle(color: AppTheme.primaryColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppTheme.greyColor.withAlpha(60),
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: AppTheme.primaryColor,
                        ),
                        hintText: AppConstants.fpNewPassTxt,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible1 = !isVisible1;
                            });
                          },
                          icon: isVisible1
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppTheme.primaryColor,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: AppTheme.primaryColor,
                                ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      AppConstants.fpEnterConfirmPassTxt,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextFormField(
                      controller: confirmPassController,
                      obscureText: isVisible2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppConstants.ssAllErrorTxt;
                        }
                        return null;
                      },
                      style: TextStyle(color: AppTheme.primaryColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppTheme.greyColor.withAlpha(60),
                        errorStyle: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: AppTheme.errorColor),
                        hintText: AppConstants.fpConfirmPassTxt,
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: AppTheme.primaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible2 = !isVisible2;
                            });
                          },
                          icon: isVisible2
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppTheme.primaryColor,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: AppTheme.primaryColor,
                                ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Consumer<ForgotViewModel>(
                builder: (context, forgotVM, _) {
                  return SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: forgotVM.isLoading
                          ? null
                          : () async {
                        if (!_formKey.currentState!.validate()) return;

                        final pass = passController.text.trim();
                        final confirmPass = confirmPassController.text.trim();

                        if (pass != confirmPass) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords do not match'),
                              backgroundColor: AppTheme.errorColor,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 3),
                            ),
                          );
                          return;
                        }

                        final success =
                        await forgotVM.resetPass(widget.email, pass, confirmPass);

                        if (!mounted) return;

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Password reset successfully'),
                              backgroundColor: AppTheme.successColor,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                forgotVM.Error ?? 'Failed to reset password',
                              ),
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
                                    Icons.password,
                                    color: AppTheme.secColor,
                                    size: 25,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppConstants.fpSaveTxt,
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
