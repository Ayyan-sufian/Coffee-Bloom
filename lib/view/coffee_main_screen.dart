import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model_view/coffee_view_model.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/custom_addcart_sheet.dart';
import 'package:coffee_bloom/view/widgets/custom_coffee_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CoffeeMainScreen extends StatefulWidget {
  final String id;

  const CoffeeMainScreen({super.key, required this.id});

  @override
  State<CoffeeMainScreen> createState() => _CoffeeMainScreenState();
}

class _CoffeeMainScreenState extends State<CoffeeMainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoffeeViewModel>().fetchCoffee(id: widget.id);
    });
  }

  int selectedIndex = 0;
  bool isWholeChecked = false;
  bool isAlmondChecked = false;
  bool isOatChecked = false;


  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CoffeeViewModel>();
    final size = MediaQuery.of(context).size;

    if (vm.isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppTheme.primaryColor),
        ),
      );
    }

    if (vm.coffee.isEmpty) {
      return const Scaffold(body: Center(child: Text("No coffee data found")));
    }

    return Scaffold(
      body: context.watch<CoffeeViewModel>().isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: AppTheme.primaryColor),
            )
          : SafeArea(
              top: false,
              child: PageView.builder(
                itemCount: vm.coffee.length,
                itemBuilder: (context, index) {
                  final coffee = vm.coffee[index];
                  final imgUrl =
                      AppConstants.imgBaseUrl + (coffee.imageUrl ?? "");
                  final double? rating = coffee.rating?.toDouble();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                            child: Image.network(imgUrl, fit: BoxFit.cover),
                          ),
                        ),

                        /// Container ends here
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                  coffee.coffeeName ?? "",
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                Text(
                                  coffee.coffeeDescription ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                Row(
                                  children: [
                                    RatingBar(
                                      initialRating: rating ?? 0.0,
                                      allowHalfRating: false,
                                      onRatingUpdate: (value) {},
                                      ratingWidget: RatingWidget(
                                        full: Icon(
                                          Icons.star,
                                          color: AppTheme.yellowColor,
                                        ),
                                        half: Icon(
                                          Icons.star_half,
                                          color: AppTheme.yellowColor,
                                        ),
                                        empty: Icon(
                                          Icons.star,
                                          color: AppTheme.greyColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "($rating)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppTheme.greyColor),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text(
                                  AppConstants.descriptionTxt,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                Text(
                                  coffee.coffeeDescription ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  AppConstants.csSizeTxt,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppTheme.blackColor),
                                ),

                                Row(
                                  children: [
                                    CustomCoffeeCard(
                                      size: AppConstants.csSmallTxt,
                                      oz: AppConstants.csSmallOZTxt,
                                      index: 0,
                                      selectedIndex: selectedIndex,
                                      onTap: () {
                                        setState(() => selectedIndex = 0);
                                      },
                                    ),
                                    CustomCoffeeCard(
                                      size: AppConstants.csMedTxt,
                                      oz: AppConstants.csMedOZTxt,
                                      index: 1,
                                      selectedIndex: selectedIndex,
                                      onTap: () {
                                        setState(() => selectedIndex = 1);
                                      },
                                    ),
                                    CustomCoffeeCard(
                                      size: AppConstants.csLargeTxt,
                                      oz: AppConstants.csLargeOZTxt,
                                      index: 2,
                                      selectedIndex: selectedIndex,
                                      onTap: () {
                                        setState(() => selectedIndex = 2);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppConstants.csDChoiceTxt,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor: AppTheme.primaryColor,
                                      value: isWholeChecked,
                                      onChanged: (value) {
                                        setState(
                                          () => isWholeChecked = value ?? false,
                                        );
                                      },
                                    ),
                                    Text(AppConstants.csWholeTxt),
                                    const Spacer(),
                                    Text(AppConstants.csWholePriceTxt),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor: AppTheme.primaryColor,
                                      value: isAlmondChecked,
                                      onChanged: (value) {
                                        setState(
                                          () =>
                                              isAlmondChecked = value ?? false,
                                        );
                                      },
                                    ),
                                    Text(AppConstants.csAlmondTxt),
                                    const Spacer(),
                                    Text(AppConstants.csAlmondPriceTxt),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor: AppTheme.primaryColor,
                                      value: isOatChecked,
                                      onChanged: (value) {
                                        setState(
                                          () => isOatChecked = value ?? false,
                                        );
                                      },
                                    ),
                                    Text(AppConstants.csOatTxt),
                                    const Spacer(),
                                    Text(AppConstants.csOatPriceTxt),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const AddToCartSheet(),
                                );
                              },
                              child: Text(
                                AppConstants.csAddCartTxt,
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: AppTheme.secColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
