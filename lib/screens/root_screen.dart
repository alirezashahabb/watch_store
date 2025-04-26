import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/screens/basket_screen.dart';
import 'package:watch_store/screens/home/home_screen.dart';
import 'package:watch_store/screens/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

int _selctedIndex = 0;

final GlobalKey<NavigatorState> homeKey = GlobalKey();
final GlobalKey<NavigatorState> basketKey = GlobalKey();
final GlobalKey<NavigatorState> profileKey = GlobalKey();

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: AppTextStyles.btmNavActive,
        unselectedLabelStyle: AppTextStyles.btmNavInActive,
        backgroundColor: AppColors.appbar,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: AppColors.btmNavActiveItem,
        unselectedItemColor: AppColors.btmNavInActiveItem,
        currentIndex: _selctedIndex,
        onTap: (value) {
          setState(() {
            _selctedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.svg.home,
              height: 22,
              colorFilter: ColorFilter.mode(
                AppColors.btmNavInActiveItem,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              Assets.svg.home,
              height: 22,
              colorFilter: ColorFilter.mode(
                AppColors.btmNavActiveItem,
                BlendMode.srcIn,
              ),
            ),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.cart,
                height: 22,
                colorFilter: ColorFilter.mode(
                  AppColors.btmNavInActiveItem,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                Assets.svg.cart,
                height: 22,
                colorFilter: ColorFilter.mode(
                  AppColors.btmNavActiveItem,
                  BlendMode.srcIn,
                ),
              ),
              label: 'سبد خرید'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.svg.user,
              height: 22,
              colorFilter: ColorFilter.mode(
                AppColors.btmNavInActiveItem,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              Assets.svg.user,
              height: 22,
              colorFilter: ColorFilter.mode(
                AppColors.btmNavActiveItem,
                BlendMode.srcIn,
              ),
            ),
            label: 'پروفایل',
          ),
        ],
      ),
      body: IndexedStack(index: _selctedIndex, children: [
        Navigator(
          key: homeKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: settings,
          ),
        ),
        Navigator(
          key: basketKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => BasketScreen(),
            settings: settings,
          ),
        ),
        Navigator(
          key: profileKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => ProfileScreen(),
            settings: settings,
          ),
        ),
      ]),
    );
  }
}
