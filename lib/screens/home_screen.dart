import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/utils/image_loading_service.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/category.dart';
import 'package:watch_store/widgets/error_state.dart';
import 'package:watch_store/widgets/product_items.dart';
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
                          VerticalText(
                            title: 'پیشنهادات ویژه',
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.amazingProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var product = state.home.amazingProducts[index];
                                return ProductItems(
                                  price: '${product.price}',
                                  productName: product.title!,
                                  discount: product.discount,
                                  oldPrice: product.discountPrice,
                                  specialExpiration: product.specialExpiration,
                                  image: product.image!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDimens.large.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          VerticalText(
                            title: 'پر فروش ترین ها',
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.mostSellerProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var product =
                                    state.home.mostSellerProducts[index];
                                return ProductItems(
                                  price: '${product.price}',
                                  productName: product.title!,
                                  discount: product.discount,
                                  oldPrice: product.discountPrice,
                                  // specialExpiration: product.specialExpiration,
                                  image: product.image!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppDimens.large),
                      width: double.infinity,
                      child: ImageLoadingService(
                        mainImage:
                            'https://watchstore.sasansafari.com/public/images/sliders/big/1652882081.jpg',
                        radius: AppDimens.medium,
                      ),
                    ),
                    AppDimens.large.height,
                  ],
                ),
              );
            } else if (state is HomeErrorState) {
              return ErrorScreen(
                onTap: () {
                  context.read<HomeBloc>().add(HomeInitEvent());
                },
              );
            } else {
              throw Exception('stat is not support');
            }
          },
        ),
      ),
    ));
  }
}
