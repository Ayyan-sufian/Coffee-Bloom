import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/custom_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<Map<String, dynamic>> chips = [
    {'title': "Hot coffee",
      'isSelected': false,
    },{'title': "Cold coffee",
      'isSelected': false,
    },{'title': "Late coffee",
      'isSelected': false,
    },{'title': "Ice coffee",
      'isSelected': false,
    },
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
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.xmark,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    AppConstants.fsFilterTxt,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppConstants.fsClearTxt,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                AppConstants.fsSelectTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.textBlackColor),
              ),
              Wrap(
                  spacing: 5,
                  children: List.generate(chips.length, (index) {
                    return Chips(
                        //id: chips[index].id,
                        title: chips[index]['title'],
                        isSelected: chips[index]['isSelected'],
                        onTap: (){
                          setState(() {
                            chips[index]['isSelected'] = !chips[index]['isSelected'];
                          });
                        });
                  },)
              ),
              Text(
                AppConstants.fsTopicsTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.textBlackColor),
              ),
              Wrap(
                  spacing: 1,
                  children: List.generate(chips.length, (index) {
                    return Chips(
                        //id: chips[index].id,
                        title: chips[index]['title'],
                        isSelected: chips[index]['isSelected'],
                        onTap: (){
                          setState(() {
                            chips[index]['isSelected'] = !chips[index]['isSelected'];
                          });
                        });
                  },)
              ),
              Text(
                AppConstants.fsKeywordsTxt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppTheme.textBlackColor),
              ),
              Wrap(
                  spacing: 5,
                  children: List.generate(chips.length, (index) {
                    return Chips(
                        //id: chips[index].id,
                        title: chips[index]['title'],
                        isSelected: chips[index]['isSelected'],
                        onTap: (){
                          setState(() {
                            chips[index]['isSelected'] = !chips[index]['isSelected'];
                          });
                        });
                  },)
              ),
              Spacer(),
              Center(child: ElevatedButton(onPressed: (){}, child: Text(AppConstants.fsApplyTxt)))
            ],
          ),
        ),
      ),
    );
  }
}
