import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/category.dart';
import 'package:watch_store/widgets/search_btn.dart';
import 'package:watch_store/widgets/vertical_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeResponseState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBtn(
                      onTap: () {},
                    ),
                    AppDimens.large.height,
                    HomeSlider(
                      sliderModel: state.home,
                    ),
                    // category
                    AppDimens.large.height,
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.home.categories.length,
                        itemBuilder: (context, index) {
                          return CategorySection(
                            categoryModel: state.home.categories[index],
                          );
                        },
                      ),
                    ),
                    // Product
                    AppDimens.large.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          VerticalText(),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(
                                    AppDimens.small,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: AppDimens.large,
                                    right: AppDimens.medium,
                                  ),
                                  height: 298,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(
                                            AppDimens.medium),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: AppColors.productBgGradiant,
                                    ),
                                  ),
                                  child: Column(
                                    spacing: AppDimens.small,
                                    children: [
                                      Assets.png.unnamed.image(),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'ساعت مردانه',
                                          style: AppTextStyles.productTitle,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppDimens.medium,
                                              ),
                                              color: AppColors.error,
                                            ),
                                            child: Text(
                                              '20%',
                                              style: AppTextStyles.mainbuttn,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '500000 تومان',
                                                style:
                                                    AppTextStyles.productTitle,
                                              ),
                                              Text(
                                                '250000',
                                                style:
                                                    AppTextStyles.oldPriceStyle,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 2,
                                                color: AppColors
                                                    .focusedBorderColor,
                                              ),
                                              Text(
                                                '9:22:10',
                                                style: AppTextStyles.title,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDimens.large.height,
                  ],
                ),
              );
            } else if (state is HomeErrorState) {
              return Text('خطا');
            } else {
              throw Exception('stat is not support');
            }
          },
        ),
      ),
    ));
  }
}
