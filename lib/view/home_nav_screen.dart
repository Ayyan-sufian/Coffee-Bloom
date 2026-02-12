import 'package:coffee_bloom/view/category_id_screen.dart';
import 'package:coffee_bloom/view/favourite_screen.dart';
import 'package:coffee_bloom/view/home_page_screen.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/profile_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_view/auth_vm.dart';
import '../model_view/category_view_model.dart';


class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _currentIndex = 0;
  
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _checkAuth();
    _screens = [
      const HomePageScreen(),
      FavouriteScreen(goBack: () => setState(() => _currentIndex = 0)),
      const CategoryIdScreen(CateName: 'Cold coffee',),
      const ProfileScreen(),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authVM = context.read<AuthViewModel>();
      final token = await authVM.getAccessToken();
      await context.read<CategoryViewModel>().fetchCategories(token!);
      await context.read<CategoryViewModel>().fetchCategoryId(token, '2');
    });
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    
    final authVM = Provider.of<AuthViewModel>(context, listen: false);
    final isLoggedIn = await authVM.isLoggedIn();
    
    if (!isLoggedIn && mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.favorite, 1),
              _buildNavItem(Icons.shopping_cart, 2),
              _buildNavItem(Icons.person, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isActive ? 34 : 30,
            color: isActive ? AppTheme.secColor : AppTheme.iconColor,
          ),
          if (isActive) ...[
            const SizedBox(height: 8),
            Icon(
              Icons.circle,
              size: 10,
              color: AppTheme.secColor,
            ),
          ],
        ],
      ),
    );
  }
}

