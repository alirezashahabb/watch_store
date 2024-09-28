import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/data/repo/repo_test.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/screens/basket_screen.dart';
import 'package:watch_store/screens/home/home_screen.dart';
import 'package:watch_store/screens/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    RepoTest().getData();
  }

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
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.svg.cart,
                color: AppColors.btmNavActiveItem,
              ),
              label: 'فروشگاه',
              icon: SvgPicture.asset(
                Assets.svg.cart,
                color: AppColors.btmNavInActiveItem,
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
