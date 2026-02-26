import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/app_drawer.dart';
import 'package:coffee_bloom/view/widgets/custom_history_card.dart';
import 'package:coffee_bloom/view/widgets/drawer_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/favorite_model.dart';
import '../model_view/auth_vm.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<FavoriteModel> cardList = [
    FavoriteModel(
      imgPath: ImagesPath.coffee1Img,
      name: "Cold coffee cappuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.coffee1Img,
      name: "Cold coffee cappuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.coffee2Img,
      name: "Cold coffee cappuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.obCoffeeImg,
      name: "Cold coffee cappuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.coffee1Img,
      name: "Cold coffee frapuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.coffee1Img,
      name: "Cold coffee frapuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.secColor,
        title: Center(
          child: Text(
            AppConstants.hsHistoryTxt,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      drawer: AppDrawer(
        selectedIndex: selectedIndex,
        menuItems: DrawerMenuData.items,
        onItemTap: (index) {
          final item = DrawerMenuData.items[index];
          if (selectedIndex == index) return;

          setState(() {
            selectedIndex = index;
          });

          if (item.screen == null) return;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.screen!),
            );
          });
        },
        onLogout: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            authVM.logout(context);
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  final item = cardList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomHistoryCard(item: item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
