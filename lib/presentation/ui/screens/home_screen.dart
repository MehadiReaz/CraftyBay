import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:e_commerce_app/presentation/ui/widgets/category_card.dart';
import 'package:e_commerce_app/presentation/ui/widgets/circular_icon_button.dart';
import 'package:e_commerce_app/presentation/ui/widgets/home/home_carousal_slider.dart';
import 'package:e_commerce_app/presentation/ui/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.craftyBayLogoNavSVG,
              // width: 50,
            ),
            Spacer(),
            CircularIconButton(
              icon: Icons.person_2_outlined,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CircularIconButton(
              icon: Icons.call_outlined,
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CircularIconButton(
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  // focusColor: Colors.grey.shade500,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              HomeCarousalSlider(),
              SectionHeader(
                  title: 'All Categories',
                  onTap: () {
                    Get.find<MainBottomNavController>().changeScreen(1);
                  }),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CategoryCard(),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'Popular',
                  onTap: () {
                    Get.to(ProductListScreen());
                  }),
              SizedBox(
                height: 195,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'Special',
                  onTap: () {
                    Get.to(ProductListScreen());
                  }),
              SizedBox(
                height: 195,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'New',
                  onTap: () {
                    Get.to(ProductListScreen());
                  }),
              SizedBox(
                height: 195,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
