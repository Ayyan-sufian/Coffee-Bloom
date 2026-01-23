import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/filter_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.home, 'text': AppConstants.hpHomeText},
    {'icon': Icons.history, 'text': AppConstants.hpHistoryText},
    {'icon': Icons.card_giftcard, 'text': AppConstants.hpRewardsText},
    {'icon': Icons.outgoing_mail, 'text': AppConstants.hpPromoText},
    {'icon': Icons.support_agent, 'text': AppConstants.hpSupportText},
    {'icon': Icons.call, 'text': AppConstants.hpContactUsText},
    {'icon': Icons.settings, 'text': AppConstants.hpSettingsText},
  ];

  @override
  Widget build(BuildContext context) {
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
      drawer: Drawer(
        surfaceTintColor: AppTheme.secColor,
        child:Column(
          children: [
            SizedBox(height: 100,),
            Expanded(
              child: ListView.builder(
                itemCount:  _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  final isSelected = _selectedIndex == index;

                  return Container(
                    color: isSelected
                        ? AppTheme.primaryColor // selected color
                        : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        item['icon'],
                        color: isSelected ?
                            AppTheme.secColor :
                        AppTheme.primaryColor,
                      ),
                      title: Text(
                        item['text'],
                        style: TextStyle(
                          color: isSelected ?
                          AppTheme.secColor :
                          AppTheme.primaryColor,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        Navigator.pop(context); // close drawer
                        // Add navigation logic here based on index
                      },
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color:
                AppTheme.primaryColor,
              ),
              title: Text(
                AppConstants.hpLogoutText,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
             ),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add navigation logic here based on index
              },
            ),
          ],
        ),
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen(),));
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
                      return AnimatedBuilder(
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
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
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
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(item['img']),
                            ),
                            SizedBox(width: 16),
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
                  AppConstants.hpTodaySpecTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textBlackColor,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList2.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList2[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(item['img']),
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
                                  item['title'] ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "\$${item['price']}" ?? '',
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
                                  item['title'] ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "\$${item['price']}" ?? '',
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
                    itemCount: coffeeList2.length,
                    itemBuilder: (context, index) {
                      final item = coffeeList2[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(item['img']),
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
                                  item['title'] ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "\$${item['price']}" ?? '',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.secColor),
      title: Text(
        text,
        style: TextStyle(
          color: AppTheme.textBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

}
