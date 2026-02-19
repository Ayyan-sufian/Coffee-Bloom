import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/category_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model_view/category_view_model.dart';
import '../../view/theme/app_theme.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cateVM = context.watch<CategoryViewModel>();

    if (cateVM.categoryList.isEmpty) {
      return Center(
        child: Text(
          'No categories available',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }

    return SizedBox(
      height: cateVM.categoryList.length > 3 ? 350 : null,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        cacheExtent: 200,
        itemCount: cateVM.categoryList.length,
        itemBuilder: (context, index) {
          final item = cateVM.categoryList[index];
          return GestureDetector(
            onTap: () async {
              final id = item.coffeeCatagoryId;
              if (id != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryIdScreen(
                      cateName: item.coffeeCatagoryName ?? '', id: id.toString(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              color: AppTheme.transparentColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.greyColor.withAlpha(30),
                      ),
                      child: ClipOval(
                        child: _buildCategoryImage(item.imageUrl ?? ""),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.coffeeCatagoryName ?? "",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textBlackColor,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.description ?? "",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppTheme.greyColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.category, size: 40, color: AppTheme.greyColor);
        },
      );
    } else {
      try {
        final img = AppConstants.imgBaseUrl + imageUrl;
        return Image.network(
          img,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.category, size: 40, color: AppTheme.greyColor);
          },
        );
      } catch (e) {
        return Icon(Icons.category, size: 40, color: AppTheme.greyColor);
      }
    }
  }
}
