import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/components/image_loading_servie.dart';
import 'package:watch_store/data/model/slide.dart';
import 'package:watch_store/res/dimends.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({super.key, required this.imgList});

  final List<SliderModel> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
              carouselController: _controller,
              items: widget.imgList
                  .map((items) => Padding(
                        padding: const EdgeInsets.all(AppDimes.medium),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimes.medium),
                          child: ImageLoadingService(
                            mainImage: items.image,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgList
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () => _controller.animateToPage(e.key),
                          child: Container(
                            width: 8,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == e.key
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
