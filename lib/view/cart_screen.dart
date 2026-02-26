import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/custom_cart_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const CartScreen({super.key, required this.item});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: AppTheme.primaryColor,
                  ),
                  SizedBox(width: 20),
                  Text(
                    AppConstants.csCartTxt,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppTheme.textBlackColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomCartCard(item: widget.item),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.csDiscountTxt,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: AppTheme.textBlackColor),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppTheme.secColor,
                                hintText: AppConstants.csPromoCodeTxt,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: AppTheme.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                AppConstants.csApplyTxt,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: AppTheme.secColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.csSubtotalTxt,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: AppTheme.greyColor),
                        ),
                        Spacer(),
                        Text("4.3\$",
                            style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(color: AppTheme.textBlackColor),),
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.csDeliveryFeeTxt,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: AppTheme.greyColor),
                        ),
                        Spacer(),
                        Text("4.0\$",
                            style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(color: AppTheme.textBlackColor),),
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.csTotalTxt,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: AppTheme.greyColor),
                        ),
                        Spacer(),
                        Text("8.3\$",
                            style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(color: AppTheme.textBlackColor),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
