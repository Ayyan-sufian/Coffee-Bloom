import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Chips extends StatelessWidget {
  // final int id;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const Chips({
    super.key,
    // required this.id,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.chipColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppTheme.primaryColor),
          ),
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
              color: isSelected
                  ? AppTheme.secColor
                  : AppTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
