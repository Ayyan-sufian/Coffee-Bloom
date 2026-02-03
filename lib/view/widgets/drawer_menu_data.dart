import 'package:flutter/material.dart';
import '../../helper/app_constants.dart';
import '../history_screen.dart';
import '../home_nav_screen.dart';
import 'drawer_menu_item.dart';

class DrawerMenuData {
  static final List<DrawerMenuItem> items = [
    DrawerMenuItem(
      icon: Icons.home,
      title: AppConstants.hpHomeText,
      screen: HomeNavScreen(),
    ),
    DrawerMenuItem(
      icon: Icons.history,
      title: AppConstants.hpHistoryText,
      screen: HistoryScreen(),
    ),
    DrawerMenuItem(
      icon: Icons.card_giftcard,
      title: AppConstants.hpRewardsText,
    ),
    DrawerMenuItem(
      icon: Icons.outgoing_mail,
      title: AppConstants.hpPromoText,
    ),
    DrawerMenuItem(
      icon: Icons.support_agent,
      title: AppConstants.hpSupportText,
    ),
    DrawerMenuItem(
      icon: Icons.call,
      title: AppConstants.hpContactUsText,
    ),
    DrawerMenuItem(
      icon: Icons.settings,
      title: AppConstants.hpSettingsText,
    ),
  ];
}
