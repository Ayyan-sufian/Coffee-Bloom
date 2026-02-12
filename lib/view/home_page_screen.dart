import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/category_view_model.dart';
import 'package:coffee_bloom/view/filter_screen.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/app_drawer.dart';
import 'package:coffee_bloom/view/widgets/custom_category_card.dart';
import 'package:coffee_bloom/view/widgets/drawer_menu_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_view/auth_vm.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final PageController controller = PageController(viewportFraction: 0.5);
  final List<String> images = [
    ImagesPath.verifyCodeImg,
    ImagesPath.signInImg,
    ImagesPath.obMotorImg,
    ImagesPath.obCoffeeImg,
    ImagesPath.coffee1Img,
  ];

  final List<Map<String, dynamic>> coffeeList = [
    {
      'img': ImagesPath.coffee1Img,
      'title': AppConstants.hpHotCoffeeTxt,
      'subtitle': AppConstants.hpFreshTxt,
    },
    {
      'img': ImagesPath.obCoffeeImg,
      'title': AppConstants.hpHotCoffeeTxt,
      'subtitle': AppConstants.hpFreshTxt,
    },
    {
      'img': ImagesPath.coffee2Img,
      'title': AppConstants.hpHotCoffeeTxt,
      'subtitle': AppConstants.hpFreshTxt,
    },
  ];
  final List<Map<String, dynamic>> coffeeList2 = [
    {
      'img': ImagesPath.coffee2Img,
      'title': AppConstants.hpHotCoffeeTxt,
      'price': "3.92",
    },
    {
      'img': ImagesPath.coffee1Img,
      'title': AppConstants.hpHotCoffeeTxt,
      'price': "4.35",
    },
    {
      'img': ImagesPath.obCoffeeImg,
      'title': AppConstants.hpHotCoffeeTxt,
      'price': "2.67",
    },
    {
      'img': ImagesPath.obCoffeeImg,
      'title': AppConstants.hpHotCoffeeTxt,
      'price': "2.67",
    },
  ];

  int _selectedIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.secColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppConstants.hpHiText,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppTheme.primaryColor),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        menuItems: DrawerMenuData.items,
        onItemTap: (index) {
          final item = DrawerMenuData.items[index];
          if (_selectedIndex == index) return;

          setState(() {
            _selectedIndex = index;
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Text(
                  AppConstants.hpHelloThereText,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor),
                ),
                Row(
                  children: [
                    Text(
                      AppConstants.hpLetsDrinkText,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.textBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.translate,
                        color: AppTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_up,
                        color: AppTheme.primaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppTheme.textWhiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          hintText: AppConstants.hpHintText,
                          hintStyle: TextStyle(color: AppTheme.greyColor),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppTheme.greyColor,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: images.length,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) {},
                    itemBuilder: (context, index) {
                      return RepaintBoundary(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            double value = 1.0;
                            if (controller.position.haveDimensions) {
                              value = controller.page! - index;
                              value = (1 - (value.abs() * 0.3)).clamp(0.1, 1.0);
                            }
                            return Center(
                              child: Transform.scale(
                                scale: value,
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.greyColor.withAlpha(20),
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              images[index],
                              cacheHeight: 300,
                              cacheWidth: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  AppConstants.hpCategoriesTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textBlackColor,
                  ),
                ),
                Consumer<CategoryViewModel>(
                  builder: (context, vm, _) {
                    if (vm.isLoading) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 10),
                              Text(
                                'Loading categories...',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (vm.error != null) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: AppTheme.errorColor,
                                size: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                vm.error.toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: AppTheme.errorColor),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    }

                    if (vm.categoryList.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                color: AppTheme.greyColor,
                                size: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'No categories found',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return CustomCategoryCard();
                  },
                ),
                SizedBox(height: 18),
                Text(
                  AppConstants.hpTodaySpecTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textBlackColor,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 200,
                    itemCount: coffeeList2.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList2[index];
                      return RepaintBoundary(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  item['img'],
                                  width: 100,
                                  height: 100,
                                  cacheHeight: 100,
                                  cacheWidth: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] ?? '',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    item['subtitle'] ?? '',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  Text(
                                    "\$${item['price']}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
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
                SizedBox(height: 18),
                Text(
                  AppConstants.hpTrendingTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textBlackColor,
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList2.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList2[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140,
                              width: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item['img'],
                                  cacheHeight: 800,
                                  cacheWidth: 800,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  item['subtitle'] ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "\$${item['price']}",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  AppConstants.hpPopularTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textBlackColor,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 200,
                    itemCount: coffeeList2.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList2[index];
                      return RepaintBoundary(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  item['img'],
                                  width: 100,
                                  height: 100,
                                  cacheHeight: 100,
                                  cacheWidth: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] ?? '',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    item['subtitle'] ?? '',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  Text(
                                    "\$${item['price']}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
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
        ),
      ),
    );
  }
}
