import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primaryColor.withOpacity(0.12),
          ),
          child: Icon(
            Icons.tv_outlined,
            size: 32,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        const Text(
          'Electronics',
          style: TextStyle(
              fontSize: 15, color: AppColor.primaryColor, letterSpacing: 0.4),
        ),
      ],
    );
  }
}
