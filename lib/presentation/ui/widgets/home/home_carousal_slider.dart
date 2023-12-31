import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/data/models/slider_data.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarousalSlider extends StatefulWidget {
  final List<SliderData> slider;
  const HomeCarousalSlider({super.key, required this.slider});

  @override
  State<HomeCarousalSlider> createState() => _HomeCarousalSliderState();
}

class _HomeCarousalSliderState extends State<HomeCarousalSlider> {
  final ValueNotifier<int> selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (int page, _) {
              selectedSlider.value = page;
            },
            height: 180.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: widget.slider.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: AppColor.primaryColor),
                  child: Column(
                    children: [
                      Image.network(
                        sliderData.image ?? '',
                        fit: BoxFit.fill,
                        height: 180,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        ValueListenableBuilder(
            valueListenable: selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.slider.length; i++) {
                list.add(
                  Container(
                    width: 10,
                    height: 10,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: value == i ? AppColor.primaryColor : null),
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            }),
      ],
    );
  }
}
