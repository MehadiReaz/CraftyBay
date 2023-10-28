import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/screens/review_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/widgets/color_picker.dart';
import 'package:e_commerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:e_commerce_app/presentation/ui/widgets/siez_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Color> colors = [
    Colors.black,
    AppColor.primaryColor,
    Colors.brown,
    Colors.grey,
    Colors.teal,
  ];

  final List<String> sizes = [
    'S',
    'M',
    'X',
    'XL',
  ];

  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProductImageSlider(),
                productDetailsAppBar,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: productDetailsBody,
              ),
            ),
            productDetailsBottomBar,
          ],
        ),
      ),
    );
  }

  Column get productDetailsBody {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adidas show fdsfsdfsd -fdsff ',
                    style: TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Save 30%',
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
                  onChange: (_) {}),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 25,
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      letterSpacing: 0.45,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    ReviewScreen(),
                  );
                },
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    letterSpacing: 0.45,
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Card(
                color: AppColor.primaryColor,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsScreenTitleTextWidget(
                titleText: 'Color',
              ),
              Container(
                height: 30,
                child: ColorPicker(
                  initialSelected: 0,
                  colors: colors,
                  onSelected: (selectedIndex) {
                    _selectedColorIndex = selectedIndex;
                  },
                ),
              ),
              ProductDetailsScreenTitleTextWidget(
                titleText: 'Size',
              ),
              Container(
                height: 30,
                child: SizePicker(
                    sizes: sizes,
                    onSelected: (int selectedSize) {
                      _selectedSizeIndex = selectedSize;
                    },
                    initialSelected: 0),
              ),
              ProductDetailsScreenTitleTextWidget(
                titleText: 'Description',
              ),
              Text(
                'Reprehenderit Lorem culpa ipsum cupidatat. Do sunt consequat id laboris adipisicing deserunt officia non in sint laborum ad. Et eu irure fugiat dolore dolore in laboris voluptate ex ea nostrud. Excepteur officia labore proident est commodo in eiusmod commodo elit sunt magna velit.Reprehenderit Lorem culpa ipsum cupidatat. Do sunt consequat id laboris adipisicing deserunt officia non in sint laborum ad. Et eu irure fugiat dolore dolore in laboris voluptate ex ea nostrud. Excepteur officia labore proident est commodo in eiusmod commodo elit sunt magna velit.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar get productDetailsAppBar {
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

  Container get productDetailsBottomBar {
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
                '\$1000',
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
              child: Text('Add To Cart'),
            ),
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
