import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/auth_view_model.dart';
import 'package:coffee_bloom/view/home_nav_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _form = GlobalKey<FormState>();

  bool isVisible = true;
  bool isVisible2 = true;
  bool isError = false;

  void showError() {
    setState(() {
      isError = confirmPassController.text != passController.text;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeNavScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.secColor,
                        foregroundColor: AppTheme.primaryColor,
                      ),
                      child: Text(AppConstants.skipBtnTxt),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(ImagesPath.signInImg, fit: BoxFit.cover),
                ),
                SizedBox(height: 18),
                Text(
                  AppConstants.ssHelloTxt,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppTheme.blackColor,
                  ),
                ),
                Text(
                  AppConstants.ssStartedTxt,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppTheme.greyColor),
                ),
                SizedBox(height: 22),
                Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.ssNameTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextFormField(
                        controller: nameController,
                        style: TextStyle(color: AppTheme.primaryColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppConstants.ssAllErrorTxt;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppTheme.greyColor.withAlpha(60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        AppConstants.ssEmailTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextFormField(
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
                          filled: true,
                          fillColor: AppTheme.greyColor.withAlpha(60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        AppConstants.ssPasswordTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextFormField(
                        controller: passController,
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
                      SizedBox(height: 16),
                      Text(
                        AppConstants.ssConfirmPassTxt,
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
                      SizedBox(height: 16),
                      Text(
                        AppConstants.ssAddressTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.streetAddress,
                        style: TextStyle(color: AppTheme.primaryColor),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppConstants.ssAllErrorTxt;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppTheme.greyColor.withAlpha(60),
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
                            AppConstants.ssAlreadyAccTxt,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppConstants.ssSignInTxt,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        AppConstants.ssByClickTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: authVM.isLoading
                        ? null
                        : () async {
                      print("Calling api");
                            showError();

                            if (isError != true &&
                                _form.currentState!.validate()) {
                              final data = {
                                'name': nameController.text.trim(),
                                'email': emailController.text.trim(),
                                'password': passController.text.trim(),
                                'address': addressController.text.trim(),
                              };
                              await authVM.signUp(data);
                              print("Called api");

                              print('SIGNUP RESPONSE IS NULL? ${authVM.signupResponse == null}');
                              print('ERROR: ${authVM.error}');
                              if (authVM.signupResponse != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerificationScreen(),
                                  ),
                                );
                              }
                            }
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: authVM.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                        AppConstants.msContinueTxt,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
