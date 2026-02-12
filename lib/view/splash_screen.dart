import 'dart:async';

import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/home_nav_screen.dart';
import 'package:coffee_bloom/view/onbording_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../model_view/auth_vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _checkAuth() async {
    final authVM = AuthViewModel();
    final isLoggedIn = await authVM.isLoggedIn();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const HomeNavScreen() : const OnBoardingScreen(),
      ),
    );
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
