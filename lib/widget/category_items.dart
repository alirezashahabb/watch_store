import 'package:flutter/material.dart';
import 'package:watch_store/components/image_loading_servie.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimends.dart';

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
      child: Center(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(12, 10, 10, 24),
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
                child: ImageLoadingService(
                  mainImage: imagePath,
                )),
            Text(
              categoryName,
              style: AppTextStyles.title,
            ),
          ],
        ),
      ),
    );
  }
}
