import 'package:e_commerce_app/presentation/state_holder/category_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce_app/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHomeScreen();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.find<MainBottomNavController>().backToHomeScreen();
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                return GridView.builder(
                    itemCount:
                        categoryController.categoryModel.data?.length ?? 0,
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryCard(
                            onTap: () {
                              Get.to(ProductListScreen(
                                  categoryId: categoryController
                                      .categoryModel.data![index].id!));
                            },
                            categoryData:
                                categoryController.categoryModel.data![index]),
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
