import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watch_store/res/colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    super.key,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedItem = index;
                  });
                },
                height: 160.0,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
              ),
              items: [
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.all(12),
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.blueAccent,
                ),
              ],
            ),
            Positioned(
              bottom: 12,
              child: AnimatedSmoothIndicator(
                activeIndex: selectedItem,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: AppColors.btmNavActiveItem,
                  dotColor: AppColors.btmNavInActiveItem,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
