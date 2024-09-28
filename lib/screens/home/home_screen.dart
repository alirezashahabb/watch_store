import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/data/repo/home_repo.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/res/string.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/widget/app_slider.dart';
import 'package:watch_store/widget/category_items.dart';
import 'package:watch_store/widget/product_item.dart';
import 'package:watch_store/widget/search_bar.dart';
import 'package:watch_store/widget/vertical_text_best_seller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final homeBloc = HomeBloc(homerepo);
          homeBloc.add(HomeStartedEvent());
          return homeBloc;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeSuccessState) {
                  return Column(
                    children: [
                      // search bar
                      SearchBtn(
                        onTap: () {},
                      ),
                      // AppSlider
                      AppSlider(
                        imgList: state.homeModel.sliders,
                      ),
                      // Category Section
                      SizedBox(
                          width: 62,
                          height: 62,
                          child: ListView.builder(
                            itemCount: state.homeModel.categories.length,
                            itemBuilder: (context, index) {
                              CategoryItems(
                                categoryName: AppStrings.classic,
                                imagePath: Assets.svg.clasic,
                                linerColors: AppColors.catClasicColors,
                                onTap: () {},
                              );
                              return null;
                            },
                          )),
                      AppDimes.large.hight,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: VerticalTextBestSeller(),
                            ),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                itemCount: 8,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return const ProductItem(
                                    price: 12000,
                                    productName: 'ساعت نیوفیس',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeErrorState) {
                  return const Text('Error');
                } else {
                  throw Exception('state is not support');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
