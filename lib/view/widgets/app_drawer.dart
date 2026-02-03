import 'package:coffee_bloom/view/widgets/drawer_menu_item.dart';
import 'package:flutter/material.dart' ;

import '../../helper/app_constants.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final List<DrawerMenuItem> menuItems;
  final ValueChanged<int> onItemTap;
  final VoidCallback onLogout;

  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.menuItems,
    required this.onItemTap,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: AppTheme.secColor,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),


            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isSelected = selectedIndex == index;

                  return Container(
                    color: isSelected
                        ? AppTheme.primaryColor
                        : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: isSelected
                            ? AppTheme.secColor
                            : AppTheme.primaryColor,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: isSelected
                              ? AppTheme.secColor
                              : AppTheme.primaryColor,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        onItemTap(index);
                      },
                    ),
                  );
                },
              ),
            ),

            /// LOGOUT
            ListTile(
              leading: Icon(
                Icons.logout,
                color: AppTheme.primaryColor,
              ),
              title: Text(
                AppConstants.hpLogoutText,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
