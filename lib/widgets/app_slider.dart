import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watch_store/data/model/home_model.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/utils/image_loading_service.dart';

class HomeSlider extends StatefulWidget {
  final HomeModel sliderModel;
  const HomeSlider({
    super.key,
    required this.sliderModel,
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
              items: widget.sliderModel.sliders.map((i) {
                return ImageLoadingService(
                  mainImage: i.image,
                  radius: 12,
                );
              }).toList(),
            ),
            Positioned(
              bottom: 12,
              child: AnimatedSmoothIndicator(
                activeIndex: selectedItem,
                count: widget.sliderModel.sliders.length,
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
