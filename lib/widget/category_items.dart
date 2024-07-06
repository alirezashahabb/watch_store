import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItems extends StatelessWidget {
  final VoidCallback onTap;
  final List<Color> linerColors;
  final String imagePath;
  final String categoryName;
  const CategoryItems({
    super.key,
    required this.onTap,
    required this.linerColors,
    required this.imagePath,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimes.medium),
            width: 61,
            height: 61,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: linerColors,
              ),
              borderRadius: BorderRadius.circular(AppDimes.large),
            ),
            child: SvgPicture.asset(
              imagePath,
            ),
          ),
          Text(
            categoryName,
            style: AppTextStyles.title,
          ),
        ],
      ),
    );
  }
}
