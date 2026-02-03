import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/forgot_view_model.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool isVisible1 = true;
  bool isVisible2 = true;

  bool isError = false;

  @override
  void dispose() {
    // TODO: implement dispose
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forgetVM = context.read<ForgotViewModel>();
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
            crossAxisAlignment: .center,
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
                textAlign: .center,
              ),
              SizedBox(height: 20),
              Text(
                AppConstants.fpContentTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                textAlign: .center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: .start,
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
                        errorText: isError ? AppConstants.ssErrorTxt : null,
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
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: forgetVM.isLoading
                      ? null
                      : () async{
                    final email = passController.text.trim();
                    if (!email.contains('@')) {
                      _showToast(
                        context,
                        'Please enter a valid email',
                      );
                      return;
                    }
                    await forgetVM.sendEmail(email);

                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          } else {
                            setState(() {
                              isError == true;
                            });
                          }
                        },
                  child: forgetVM.isLoading ?
                      CupertinoActivityIndicator() :
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(
                          Icons.password,
                          color: AppTheme.secColor,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        Text(
                          AppConstants.fpSaveTxt,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: AppTheme.secColor),
                        ),
                      ],
                    ),
                  ),
                ),
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
