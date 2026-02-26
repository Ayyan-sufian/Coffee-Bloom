import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';
import '../../model/favorite_model.dart';
import '../theme/app_theme.dart';

class CustomHistoryCard extends StatefulWidget {
  const CustomHistoryCard({
    super.key,
    required this.item,
  });

  final FavoriteModel item;

  @override
  State<CustomHistoryCard> createState() => _CustomHistoryCardState();
}

class _CustomHistoryCardState extends State<CustomHistoryCard> {
  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.textWhiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppTheme.cardColor),
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
                      widget.item.name,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppTheme.blackColor),
                    ),

                    Text(
                      widget.item.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppTheme.textGreyColor),
                    ),
                    Text(
                      widget.item.description,
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppTheme.primaryColor),
                      ),
                      child: Icon(Icons.remove, color: AppTheme.primaryColor),
                    ),
                  ),

                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.textBlackColor,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.primaryColor,
                      ),
                      child: Icon(Icons.add, color: AppTheme.secColor),
                    ),
                  ),
                ],
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
    );
  }
}
