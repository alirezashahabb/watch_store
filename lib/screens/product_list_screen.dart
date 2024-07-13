import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar());
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: child,
    );
  }

  @override
  // TODO: implement child
  Widget get child => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimes.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(CupertinoIcons.cart),
              Row(
                children: [
                  const Text('پر فروش ترین'),
                  SvgPicture.asset(Assets.svg.sort)
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.close),
              )
            ],
          ),
        ),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
