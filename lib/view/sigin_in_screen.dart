import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/verification_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height - 120),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                    AppConstants.ssEnterNumTxt,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppTheme.blackColor),
                  ),
                  Text(
                    AppConstants.ssVerifyCodeTxt,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor),
                  ),
                  SizedBox(height: 22),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppTheme.greyColor.withAlpha(60),
                      prefix: Text(AppConstants.ss92Txt,style: Theme.of(context).textTheme.bodyMedium
                        ,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    AppConstants.ssByClickTxt,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          AppConstants.msContinueTxt,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
