
import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';
import '../theme/app_theme.dart';

class CustomCoffeeCard extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String size;
  final String oz;
  final VoidCallback onTap;

  const CustomCoffeeCard({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.size,
    required this.oz,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          width: 100,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.secColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagesPath.cupMBImg,
                height: 40,
                width: 50,
                color: isSelected
                    ? AppTheme.secColor
                    : AppTheme.blackColor,
              ),
              const SizedBox(height: 8),
              Text(
                size,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  color: isSelected
                      ? AppTheme.secColor
                      : AppTheme.blackColor,
                ),
              ),
              Text(
                oz,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                  color: isSelected
                      ? AppTheme.secColor
                      : AppTheme.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
