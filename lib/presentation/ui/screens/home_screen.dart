import 'package:e_commerce_app/presentation/state_holder/auth/auth_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/read_profile_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/category_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/home_slider_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/new_product_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/popular_product_contoller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/special_product_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
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
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              homeScreenSearchTextField,
              SizedBox(
                height: 12,
              ),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if (homeSliderController.homeSliderInProgress) {
                    SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      ),
                    );
                  }
                  return HomeCarousalSlider(
                    slider: homeSliderController.sliderModel.data ?? [],
                  );
                },
              ),
              SectionHeader(
                  title: 'All Categories',
                  onTap: () {
                    Get.find<MainBottomNavController>().changeScreen(1);
                  }),
              homeScreenAllCategories,
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'Popular',
                  onTap: () {
                    Get.to(
                      ProductListScreen(
                        productModel: Get.find<PopularProductController>()
                            .popularProductModel,
                      ),
                    );
                  }),
              SizedBox(
                height: 195,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    return ListView.builder(
                        itemCount: productController
                                .popularProductModel.data?.length ??
                            0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: productController
                                .popularProductModel.data![index],
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'Special',
                  onTap: () {
                    Get.to(
                      ProductListScreen(
                        productModel: Get.find<SpecialProductController>()
                            .specialProductModel,
                      ),
                    );
                  }),
              SizedBox(
                height: 195,
                child: GetBuilder<SpecialProductController>(
                  builder: (productController) {
                    return ListView.builder(
                        itemCount: productController
                                .specialProductModel.data?.length ??
                            0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: productController
                                .specialProductModel.data![index],
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SectionHeader(
                  title: 'New',
                  onTap: () {
                    Get.to(
                      ProductListScreen(
                        productModel:
                            Get.find<NewProductController>().newProductModel,
                      ),
                    );
                  }),
              SizedBox(
                height: 195,
                child: GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    return ListView.builder(
                        itemCount:
                            newProductController.newProductModel.data?.length ??
                                0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: newProductController
                                .newProductModel.data![index],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  TextField get homeScreenSearchTextField {
    return TextField(
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
    );
  }

  AppBar get homeScreenAppBar {
    return AppBar(
      automaticallyImplyLeading: false,
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
            icon: Icons.brightness_2_outlined,
            onTap: () {},
          ),
          SizedBox(
            width: 10,
          ),
          CircularIconButton(
            icon: Icons.person_2_outlined,
            onTap: () async {
              await Get.find<ReadProfileController>().readProfileData();
              Get.to(() => CompleteProfileScreen());
            },
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
          SizedBox(
            width: 10,
          ),
          CircularIconButton(
            icon: Icons.logout_outlined,
            onTap: () async {
              await AuthController.clear();
              await AuthController.getAccessToken();
              Get.to(() => EmailVerificationScreen());
              Get.snackbar('Success', 'Logout successful.',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  borderRadius: 10,
                  snackPosition: SnackPosition.BOTTOM);
            },
          ),
        ],
      ),
    );
  }

  SizedBox get homeScreenAllCategories {
    return SizedBox(
      height: 90,
      child: GetBuilder<CategoryController>(
        builder: (categoryController) {
          if (categoryController.categoryListInProgress) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: categoryController.categoryModel.data?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CategoryCard(
                    categoryData: categoryController.categoryModel.data![index],
                    onTap: () {
                      Get.to(ProductListScreen(
                          categoryId: categoryController
                              .categoryModel.data![index].id!));
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
