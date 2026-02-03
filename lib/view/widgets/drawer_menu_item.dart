import 'package:flutter/material.dart';

class DrawerMenuItem {
  final IconData icon;
  final String title;
  final Widget? screen;

  const DrawerMenuItem({
    required this.icon,
    required this.title,
    this.screen,
  });
}
