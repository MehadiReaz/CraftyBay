import 'package:e_commerce_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

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
                  leading: BackButton(color: Colors.black54),
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
