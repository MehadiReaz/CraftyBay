import 'package:e_commerce_app/data/models/product_details.dart';
import 'package:e_commerce_app/presentation/state_holder/create_wish_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/review_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRatingReviewWishList extends StatelessWidget {
  final ProductDetails productDetailsData;

  const ProductRatingReviewWishList(
      {super.key, required this.productDetailsData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 24,
              color: Colors.amber,
            ),
            Text(
              '${productDetailsData.product?.star ?? 0}',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => ReviewScreen(
                  productId: productDetailsData.productId!,
                ));
          },
          child: Text(
            'Reviews',
            style: TextStyle(
                fontSize: 20,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<CreateWishListController>(
            builder: (createWishListController) {
          return Card(
            color: AppColor.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () async {
                  await setThisProductInWishlist(createWishListController);
                },
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Future<void> setThisProductInWishlist(
      CreateWishListController createWishListController) async {
    final response = await createWishListController
        .setProductInWishList(productDetailsData.productId!);
    if (response) {
      Get.snackbar('Success', 'Add wishlist successfully.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Failed', 'Add wishlist failed! Try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
