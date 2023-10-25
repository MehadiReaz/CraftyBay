import 'package:e_commerce_app/presentation/ui/screens/product_details_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(ProductDetailsScreen());
      },
      child: SizedBox(
        width: 150,
        //height: 196,
        child: Card(
          child: Column(
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.craftyBayShoePNG))),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Nike Shoe',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 0.45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$900',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        letterSpacing: 0.45,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            letterSpacing: 0.45,
                            //fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Card(
                      color: AppColor.primaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    )
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
