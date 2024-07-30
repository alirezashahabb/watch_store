import 'package:flutter/material.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/res/string.dart';

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
          SizedBox(
            width: size.width * .3,
            height: size.width * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file == null
                  ? Image.asset(Assets.png.avatar.path)
                  : Image.file(file),
            ),
          ),
          AppDimes.medium.hight,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          )
        ],
      ),
    );
  }
}
