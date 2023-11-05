import 'package:e_commerce_app/data/models/cart_list_model.dart';
import 'package:e_commerce_app/presentation/state_holder/cart_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cartData,
  });

  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              child: Image.network(
                cartData.product?.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartData.product?.title ?? '',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Size: ${cartData.size}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '  Color: ${cartData.color}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    '\$${cartData.product?.price ?? 0}',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<CartListController>()
                        .removeFromCart(cartData.productId!);
                  },
                  icon: Icon(Icons.delete_forever_outlined),
                ),
                CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 10,
                    stepValue: 1,
                    value: 1,
                    onChange: (_) {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
