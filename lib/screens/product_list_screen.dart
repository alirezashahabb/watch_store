import 'package:flutter/material.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/widget/custom_appbar.dart';
import 'package:watch_store/widget/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          TagsTitle(),
          GradViwProduct(),
        ],
      ),
    );
  }
}

class TagsTitle extends StatelessWidget {
  const TagsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimes.large),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: AppDimes.medium),
              padding: const EdgeInsets.symmetric(horizontal: AppDimes.medium),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(AppDimes.large)),
              child: const Text(
                'تستی',
                style: AppTextStyles.tagTitle,
              ),
            );
          },
        ),
      ),
    );
  }
}

class GradViwProduct extends StatelessWidget {
  const GradViwProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return const ProductItem(productName: 'ساعت هوشمند', price: 100000);
        },
      ),
    );
  }
}
