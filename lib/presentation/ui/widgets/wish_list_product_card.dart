import 'package:e_commerce_app/data/models/wish_list_model.dart';
import 'package:e_commerce_app/presentation/state_holder/delete_wish_list_product%20_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/wish_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListProductCard extends StatelessWidget {
  final WishList productData;

  const WishListProductCard({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColor.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 160,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(productData.product?.image ?? ''))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productData.product?.title ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productData.product?.price ?? 0}',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Text(
                            '${productData.product?.star ?? 0}',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      Card(
                        color: AppColor.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () async {
                              await deleteWishlistProduct(
                                  productData.productId!);
                            },
                            child: const Icon(
                              Icons.delete_forever_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteWishlistProduct(int productId) async {
    final response = await Get.find<DeleteWishListProductController>()
        .deleteWishlistProduct(productId);
    if (response) {
      Get.snackbar('Success', 'Remove from wishlist successful.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      await Get.find<WishListController>().getWishList();
    } else {
      Get.snackbar('Failed', 'Remove from wishlist failed!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
