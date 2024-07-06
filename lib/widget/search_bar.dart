import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// this widget for search bar  on application
class SearchBtn extends StatelessWidget {
  final VoidCallback onTap;

  const SearchBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(
          AppDimes.medium,
        ),
        decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(60),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                offset: Offset(0, 3),
                blurRadius: 10,
              )
            ]),
        width: double.infinity,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(Assets.png.mainLogo.path),
            const Text(
              AppStrings.searchProduct,
              style: AppTextStyles.hint,
            ),
            SvgPicture.asset(
              Assets.svg.search,
            ),
          ],
        ),
      ),
    );
  }
}
