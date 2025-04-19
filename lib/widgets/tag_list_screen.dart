import 'package:flutter/material.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
            reverse: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(AppDimens.large)),
                child: const Text(
                  "نیوفورس",
                  style: AppTextStyles.tagTitle,
                ),
              );
            }),
      ),
    );
  }
}
