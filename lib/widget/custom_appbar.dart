import 'package:badges/badges.dart' as badges;
import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

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
        child: Container(
          padding: const EdgeInsets.all(
            AppDimes.medium,
          ),
          height: preferredSize.height,
          decoration: const BoxDecoration(
              color: AppColors.appbar,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimes.medium),
                  bottomRight: Radius.circular(AppDimes.medium)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  offset: Offset(0, 2),
                  blurRadius: 3,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.close),
              ),
              Row(
                children: [
                  const Text(
                    'پر فروش ترین',
                    style: AppTextStyles.title,
                  ),
                  SvgPicture.asset(Assets.svg.sort),
                ],
              ),
              const CartBadge(
                count: 2,
              )
            ],
          ),
        ),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
    this.count = 0,
  });

  final count;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: count > 0 ? true : false,
      position: badges.BadgePosition.topStart(),
      badgeContent: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: SvgPicture.asset(
        Assets.svg.cart,
        color: Colors.black,
      ),
    );
  }
}
