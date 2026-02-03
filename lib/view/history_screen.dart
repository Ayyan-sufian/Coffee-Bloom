import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/auth_view_model.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/app_drawer.dart';
import 'package:coffee_bloom/view/widgets/drawer_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/favorite_model.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<FavoriteModel> cardList = [
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
    FavoriteModel(
      imgPath: ImagesPath.coffee2Img,
      name: "Cold coffee frapuccino",
      title: "with whipped cream and straws.",
      description: "90mg Caffeine : 100 Calories",
      price: 3.55,
    ),
    FavoriteModel(
      imgPath: ImagesPath.obCoffeeImg,
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
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.textWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppTheme.greyColor),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  ImagesPath.coffee1Img,
                                ),
                                radius: 40,
                              ),

                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: AppTheme.blackColor),
                                    ),

                                    Text(
                                      item.title,
                                      maxLines: 2,
                                      style: Theme.of(context).textTheme.bodyMedium!
                                          .copyWith(color: AppTheme.textGreyColor),
                                    ),
                                    Text(
                                      item.description,
                                      maxLines: 1,
                                      style: Theme.of(context).textTheme.bodyMedium!
                                          .copyWith(color: AppTheme.textBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                              ),
                              Text("1"),
                              IconButton(
                                onPressed: () {},
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppTheme.primaryColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: AppTheme.secColor,
                                  ),
                                ),
                              ),

                              Spacer(),

                              IconButton(
                                onPressed: () {},
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppTheme.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppConstants.hsReorderTxt,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppTheme.secColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
