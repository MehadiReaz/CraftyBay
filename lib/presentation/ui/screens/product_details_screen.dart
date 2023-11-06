import 'package:e_commerce_app/data/models/product_details.dart';
import 'package:e_commerce_app/presentation/state_holder/add_to_cart_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product_details_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/widgets/color_picker.dart';
import 'package:e_commerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_rating_review_wishlist.dart';
import 'package:e_commerce_app/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ProductImageSlider(
                      imageList: [
                        productDetailsController.productDetails.img1 ?? '',
                        productDetailsController.productDetails.img2 ?? '',
                        productDetailsController.productDetails.img3 ?? '',
                        productDetailsController.productDetails.img4 ?? '',
                      ],
                    ),
                    productDetailsAppBar(
                        productDetailsController.productDetails),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: productDetailsBody(
                        productDetailsController.productDetails),
                  ),
                ),
                productDetailsBottomBar(
                    productDetailsController.productDetails),
              ],
            ),
          );
        },
      ),
    );
  }

  Column productDetailsBody(ProductDetails productDetails) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDetails.product?.title ?? '',
                    style: TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Save ${productDetails.product?.discount ?? ''}%',
                    style: TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (value) {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
              return ProductRatingReviewWishList(
                  productDetailsData: productDetailsController.productDetails);
            },
          ),
        ),
        GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsScreenTitleTextWidget(
                    titleText: 'Color',
                  ),
                  Container(
                      height: 50,
                      child: ProductColorPicker(
                          colors: productDetailsController.availableColors,
                          onSelected: (int selectedColor) {
                            _selectedColorIndex = selectedColor;
                          },
                          initialSelected: 0)),
                  ProductDetailsScreenTitleTextWidget(
                    titleText: 'Size',
                  ),
                  Container(
                    height: 30,
                    child: SizePicker(
                        sizes: productDetailsController.availableSizes,
                        onSelected: (int selectedSize) {
                          _selectedSizeIndex = selectedSize;
                        },
                        initialSelected: 0),
                  ),
                  ProductDetailsScreenTitleTextWidget(
                    titleText: 'Description',
                  ),
                  Text(
                    '${productDetails.des ?? ''}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  AppBar productDetailsAppBar(ProductDetails productDetails) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Get.to(
            MainBottomNavigationBar(),
          );
        },
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black54),
      ),
      title: Text(
        'Product Details',
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  Container productDetailsBottomBar(ProductDetails productDetails) {
    return Container(
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
            children: [
              Text(
                'Price',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '\$${productDetails.product?.price ?? 0}',
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Spacer(),
          GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
              return SizedBox(
                width: 150,
                child: GetBuilder<AddToCartController>(
                  builder: (addToCartController) {
                    return ElevatedButton(
                      onPressed: () async {
                        Get.find<AddToCartController>()
                            .addToCart(
                                productDetailsController
                                        .productDetails.productId ??
                                    0,
                                productDetailsController
                                    .availableColors[_selectedColorIndex],
                                productDetailsController
                                    .availableSizes[_selectedSizeIndex],
                                5)
                            .then((result) {
                          if (result) {
                            Get.snackbar('Success', 'Add to cart successful.',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                borderRadius: 10,
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            Get.snackbar(
                                'Failed', 'Add to cart failed! Try again.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                borderRadius: 10,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        });
                      },
                      child: Text('Add To Cart'),
                    );
                  },
                ),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class ProductDetailsScreenTitleTextWidget extends StatelessWidget {
  const ProductDetailsScreenTitleTextWidget(
      {super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
