import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Text(
                AppConstants.hsHistoryTxt,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(width: 20),
            ],
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Container(
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
                          backgroundImage: AssetImage(ImagesPath.coffee1Img),
                          radius: 40,
                        ),
                        Column(
                          children: [
                            Text('')
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppTheme.primaryColor),
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
                            child: Icon(Icons.add, color: AppTheme.secColor),
                          ),
                        ),

                        SizedBox(width: 12,),

                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppTheme.primaryColor,
                            ),
                            child: Text(AppConstants.hsReorderTxt,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppTheme.secColor
                            ),),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
