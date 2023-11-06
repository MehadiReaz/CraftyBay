import 'package:e_commerce_app/data/models/product_details.dart';
import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/wish_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_details_screen.dart';
import 'package:e_commerce_app/presentation/ui/widgets/wish_list_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHomeScreen();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Wish List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if (wishListController.getWishListPorductsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (wishListController.wishListModel.data != null &&
                wishListController.wishListModel.data!.isEmpty) {
              return const Center(
                child: Text('WishList is empty!'),
              );
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                                productId: wishListController
                                    .wishListModel.data![index].productId!,
                              ));
                        },
                        child: FittedBox(
                          child: WishListProductCard(
                            productData:
                                wishListController.wishListModel.data![index],
                          ),
                        ),
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }
}
