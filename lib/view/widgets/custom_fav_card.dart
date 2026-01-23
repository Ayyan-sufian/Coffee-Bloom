
import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:flutter/material.dart';

import '../../model/favorite_model.dart';
import '../theme/app_theme.dart';

class FavCard extends StatelessWidget {
  const FavCard({
    super.key,
    required this.card,
  });

  final FavoriteModel card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppTheme.textGreyColor,
          ),
          color: AppTheme.textGreyColor.withAlpha(9),
        ),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(card.imgPath),
                ),
                SizedBox(height: 8,),
                Text(
                  "\$${card.price}",
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: AppTheme.blackColor),
                ),
              ],
            ),
            SizedBox(width: 9),
            Column(
              children: [
                Text(
                  card.name,
                  style: Theme.of(context).textTheme.bodyLarge!
                      .copyWith(color: AppTheme.blackColor),
                ),
                Text(
                  card.title,
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: AppTheme.textGreyColor),
                ),
                Text(
                  card.description,
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: AppTheme.textBlackColor),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.primaryColor,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        AppConstants.fvAddToCartTxt,
                        style: TextStyle(
                          color: AppTheme.secColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 9,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        AppConstants.fvRemoveTxt,
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
