import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/verification_screen.dart';
import 'package:flutter/material.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool error = false;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
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
                textAlign: .center,
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
                  controller: _emailController,
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
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                   if(_formKey.currentState!.validate()){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => VerificationScreen(),
                       ),
                     );
                   }
                   else{
                    setState(() {
                      error == true;
                    });
                   }
                  },
                  child: isLoading ?
                  null: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.send, color: AppTheme.secColor, size: 20),
                        SizedBox(width: 8),
                        Text(
                          AppConstants.seSendTxt,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppTheme.secColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
}
