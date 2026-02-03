import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/favorite_model.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/custom_fav_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  final VoidCallback goBack;

  const FavouriteScreen({super.key, required this.goBack});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.goBack();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    AppConstants.fvFavoriteTxt,
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppTheme.blackColor),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (context, index) {
                    final card = cardList[index];
                    return FavCard(card: card);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}