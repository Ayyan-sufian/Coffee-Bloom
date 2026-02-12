import 'package:coffee_bloom/view/send_email_screen.dart';
import 'package:coffee_bloom/view/sign_up_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/app_constants.dart';
import '../model_view/auth_vm.dart';
import 'home_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController lEmailController = TextEditingController();
  TextEditingController lPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  void dispose() {
    lEmailController.dispose();
    lPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  ImagesPath.loginImg,
                  cacheWidth: 240,
                  cacheHeight: 240,
                ),
              ),
              SizedBox(height: 24),
              Text(
                AppConstants.ssHelloTxt,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppTheme.blackColor,
                  fontSize: 42,
                ),
              ),
              Text(
                AppConstants.lsAgainTxt,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppTheme.primaryColor,
                  fontSize: 42,
                ),
              ),
              SizedBox(height: 12),
              Text(
                AppConstants.lsMissTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
              ),
              SizedBox(height: 22),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.ssEmailTxt,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextFormField(
                      controller: lEmailController,
                      keyboardType: TextInputType.emailAddress,
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SendEmailScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppConstants.lsForgetTxt,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppConstants.ssPasswordTxt,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextFormField(
                      controller: lPassController,
                      obscureText: isVisible,
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible
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

                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppConstants.lsDoNotAccTxt,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppConstants.lsSignupTxt,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppTheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.1),
                    Consumer<AuthViewModel>(
                      builder: (context, authVM, _) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: authVM.isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      final data = {
                                        "email": lEmailController.text.trim(),
                                        "password": lPassController.text.trim(),
                                      };
                                      await authVM.login(data: data);

                                      final currentContext = context;
                                      if (!currentContext.mounted) return;

                                      if (authVM.loginResponse != null) {
                                        ScaffoldMessenger.of(currentContext).showSnackBar(
                                          const SnackBar(
                                            content: Text('Login successful'),
                                            backgroundColor: AppTheme.successColor,
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                        Navigator.pushReplacement(
                                          currentContext,
                                          MaterialPageRoute(
                                            builder: (context) => const HomeNavScreen(),
                                          ),
                                        );
                                      } else if (authVM.message != null) {
                                        ScaffoldMessenger.of(currentContext).showSnackBar(
                                          SnackBar(
                                            content: Text(authVM.message!),
                                            backgroundColor: AppTheme.errorColor,
                                            behavior: SnackBarBehavior.floating,
                                            duration: const Duration(seconds: 3),
                                          ),
                                        );
                                      }
                                    }
                                  },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: authVM.isLoading
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
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
