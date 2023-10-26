import 'package:e_commerce_app/presentation/ui/screens/home_screen.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImageSlider(),
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Get.to(
                        HomeScreen(),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black54),
                  ),
                  title: Text(
                    'Product Details',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Adidas show fdsfsdfsd -fdsff ',
                  style: TextStyle(overflow: TextOverflow.fade),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
