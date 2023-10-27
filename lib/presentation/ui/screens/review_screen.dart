import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/screens/create_review_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width:
                            double.infinity, // Expand the width to the maximum
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
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
                                      'Rabbil',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Hasan',
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
                                  'Reprehenderit Lorem culpa ipsum cupidatat. Do sunt consequat id laboris adipisicing deserunt officia non in sint laborum ad. Et eu irure fugiat dolore dolore in laboris voluptate ex ea nostrud. Excepteur officia labore proident est commodo in eiusmod commodo elit sunt magna velit.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                      '(100)',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        Get.to(CreateReviewScreen());
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
          )),
    );
  }
}
