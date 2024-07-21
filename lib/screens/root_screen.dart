import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/screens/basket_screen.dart';
import 'package:clock_shop/screens/home_screen.dart';
import 'package:clock_shop/screens/profile_screen.dart';
import 'package:clock_shop/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: getLayOut(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.btmNavActiveItem,
          unselectedItemColor: AppColors.btmNavInActiveItem,
          selectedLabelStyle: AppTextStyles.title.copyWith(fontSize: 14),
          unselectedLabelStyle: AppTextStyles.title,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.svg.home,
                color: AppColors.btmNavActiveItem,
              ),
              label: 'خانه',
              icon: SvgPicture.asset(
                Assets.svg.home,
                color: AppColors.btmNavInActiveItem,
              ),
            ),
            const BottomNavigationBarItem(
              activeIcon: CartBadge(
                count: 2,
              ),
              label: 'فروشگاه',
              icon: CartBadge(
                count: 3,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.svg.user,
                color: AppColors.btmNavActiveItem,
              ),
              label: 'پروفایل',
              icon: SvgPicture.asset(
                Assets.svg.user,
                color: AppColors.btmNavInActiveItem,
              ),
            ),
          ]),
    );
  }

  List<Widget> getLayOut() {
    return <Widget>[
      const HomeScreen(),
      const BasketScreen(),
      const ProfileScreen(),
    ];
  }
}
