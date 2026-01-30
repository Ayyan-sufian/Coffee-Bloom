import 'package:coffee_bloom/view/favourite_screen.dart';
import 'package:coffee_bloom/view/home_page_screen.dart';
import 'package:coffee_bloom/view/profile_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _currentIndex = 0;

  List<Widget> get _screen => [
    HomePageScreen(),
  FavouriteScreen(goBack: () => setState(() => _currentIndex = 0),),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
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

