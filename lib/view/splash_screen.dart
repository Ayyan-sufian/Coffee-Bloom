import 'dart:async';

import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/service/auth_local_storage.dart';
import 'package:coffee_bloom/view/home_nav_screen.dart';
import 'package:coffee_bloom/view/onbording_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final authStorage = AuthLocalStorage();
    final isLoggedIn = await authStorage.isLoggedIn();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? HomeNavScreen() : OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Text(
          AppConstants.splashTxt,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
