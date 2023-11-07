import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/state_holder/create_wish_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_details_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(ProductDetailsScreen(
          productId: product.id!,
        ));
      },
      child: SizedBox(
        width: 155,
        //height: 196,
        child: Card(
          child: Column(
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? ''),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                product.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 0.45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
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
                          '${product.star ?? 0}',
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
                    InkWell(
                      onTap: () async {
                        Get.find<CreateWishListController>()
                            .setProductInWishList(product.id!);
                      },
                      child: Card(
                        color: AppColor.primaryColor,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
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
