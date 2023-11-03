import 'package:e_commerce_app/data/models/category_data.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryData,
    required this.onTap,
  });
  final CategoryData categoryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.symmetric(horizontal: 8),
            //padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor.withOpacity(0.12),
            ),
            child: Image.network(
              categoryData.categoryImg ?? '',
              // height: 80,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categoryData.categoryName ?? '',
            style: TextStyle(
                fontSize: 15, color: AppColor.primaryColor, letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }
}
