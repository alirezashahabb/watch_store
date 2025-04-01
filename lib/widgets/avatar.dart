import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.onTap, required this.file});
  final onTap;
  final file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: size.width * .3,
            height: size.width * .3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: file == null
                ? Image.asset(Assets.png.avatar.path)
                : Image.file(file),
          ),
          AppDimens.medium.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          )
        ],
      ),
    );
  }
}
