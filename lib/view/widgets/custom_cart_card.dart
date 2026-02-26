import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';
import '../theme/app_theme.dart';

class CustomCartCard extends StatefulWidget {
  const CustomCartCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  State<CustomCartCard> createState() => _CustomCartCardState();
}

class _CustomCartCardState extends State<CustomCartCard> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final img = AppConstants.imgBaseUrl + widget.item['coffee_img'];
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppTheme.cardColor.withAlpha(18)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 40,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.item['coffee_name'],
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.blackColor,
                      ),
                    ),

                    Text(
                      widget.item['coffee_desc'],
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppTheme.textGreyColor,
                      ),
                    ),
                    Text(
                      widget.item['coffee_desc'],
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppTheme.textBlackColor,
                      ),
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
                icon: Icon(Icons.delete_outline,color: AppTheme.primaryColor,)
              ),

              Spacer(),

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
            ],
          ),
        ],
      ),
    );
  }
}
