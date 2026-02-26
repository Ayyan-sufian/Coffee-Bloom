import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/cart_screen.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AddToCartSheet extends StatelessWidget {
  final Map<String, dynamic> item;
  const AddToCartSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
             Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 36,
              ),
            ),
      
            const SizedBox(height: 16),
      
            const Text(
              AppConstants.csAddCartTxt,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
      
            const SizedBox(height: 24),
      
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text("Continue shopping"),
              ),
            ),
      
            const SizedBox(height: 12),
      
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(item: item,),));
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  side: BorderSide(color: AppTheme.primaryColor),
                ),
                child: Text(
                  "View my cart",
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
