import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';
import '../theme/app_theme.dart';

class CustomCardId extends StatelessWidget {
  const CustomCardId({
    super.key,
    required this.imgUrl, required this.name, required this.desc, required this.price,
  });

  final String imgUrl;
  final String name;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    final img = AppConstants.imgBaseUrl+imgUrl;
    return Container(
      height: 320,
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.textWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppTheme.greyColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
              img,
              width: 80,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.category,
                  size: 40,
                  color: AppTheme.greyColor,
                );
              },
                        ),
            )
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 5,),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textBlackColor,
                ),
              ),
              Text(
                desc,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: AppTheme.greyColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textBlackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: AppTheme.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: AppTheme.textWhiteColor,
                      ),
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
