import 'package:e_commerce_app/data/models/review_model.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/read_profile_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/review_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/create_review_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});
  final int productId;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewController>().getReview(widget.productId);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Reviews',
            style: TextStyle(color: Colors.black54),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder<ReviewController>(builder: (reviewController) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: reviewController.reviewModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ReviewCard(
                        reviewData: reviewController.reviewModel.data![index],
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 80,
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
                    Text(
                      'Reviews',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '(${reviewController.reviewModel.data?.length ?? 0})',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () async {
                        await Get.find<ReadProfileController>()
                            .readProfileData();
                        Get.to(() => CreateReviewScreen(
                              productId: widget.productId,
                            ));
                      },
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(
                        Icons.add,
                        size: 30,
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
        }),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewData,
  });
  final ReviewData reviewData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Expand the width to the maximum
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.black54,
                      size: 30,
                    ),
                    backgroundColor: Colors.grey.shade100,
                    radius: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    reviewData.profile?.cusName ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                reviewData.description ?? '',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Create at: ${reviewData.createdAt.toString().substring(0, 10)}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Text(
                    reviewData.rating.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
