import 'package:e_commerce_app/presentation/state_holder/product_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryId});
  final int categoryId;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>()
          .getProductListByCategoryList(widget.categoryId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(
              MainBottomNavigationBar(),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GridView.builder(
                  itemCount:
                      productListController.productModel.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                          product:
                              productListController.productModel.data![index]),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
