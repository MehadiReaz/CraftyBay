import 'package:e_commerce_app/presentation/state_holder/cart_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Cart ',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () =>
                Get.find<MainBottomNavController>().backToHomeScreen(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.getCartListInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount:
                              cartListController.cartListModel.data?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                                cartData: cartListController
                                    .cartListModel.data![index]);
                          }))),
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(.1),
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(15),
                    topStart: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '\$${cartListController.totalPrice}',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Checkout'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
