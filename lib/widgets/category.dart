import 'package:flutter/material.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/data/model/category_model.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/utils/image_loading_service.dart';

class CategorySection extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategorySection({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Container(
            margin: EdgeInsets.only(
              left: AppDimens.large,
              right: AppDimens.medium,
            ),
            height: 61,
            width: 61,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppDimens.large,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.catClasicColors,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ImageLoadingService(
                mainImage: categoryModel.image,
              ),
            )),
        Text(
          categoryModel.title,
          style: AppTextStyles.title,
        )
      ],
    );
  }
}
