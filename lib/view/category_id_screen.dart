import 'package:coffee_bloom/model_view/auth_vm.dart';
import 'package:coffee_bloom/model_view/category_view_model.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:coffee_bloom/view/widgets/custom_card_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryIdScreen extends StatefulWidget {
  final String CateName;
  const CategoryIdScreen({super.key, required this.CateName});

  @override
  State<CategoryIdScreen> createState() => _CategoryIdScreenState();
}

class _CategoryIdScreenState extends State<CategoryIdScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      final authVM = context.read<AuthViewModel>();
      final token = await authVM.getAccessToken();
      await context.read<CategoryViewModel>().fetchCategoryId(token!, "1");
    });
  }

  @override
  Widget build(BuildContext context) {
    final cateVM = context.watch<CategoryViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 24),
                  ),
                  Text(
                    widget.CateName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppTheme.blackColor,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
              SizedBox(height: 20),
              cateVM.isLoading ?
                Center(child: CircularProgressIndicator()) :
              Expanded(
                child: GridView.builder(
                  itemCount: cateVM.categoryIdList.length,
                  itemBuilder: (context, index) {
                    final item = cateVM.categoryIdList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                      child: CustomCardId(
                        imgUrl: item.imageUrl ?? '',
                        name: item.coffeeName ?? '',
                        desc: item.coffeeDescription ?? '',
                        price: item.coffeePrice ?? '',
                      ),
                    );
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
