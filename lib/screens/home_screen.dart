import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/data/model/category_model.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/utils/image_loading_service.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/search_btn.dart';

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
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeResponseState) {
              return Column(
                children: [
                  SearchBtn(
                    onTap: () {},
                  ),
                  AppDimens.large.height,
                  HomeSlider(
                    sliderModel: state.home,
                  ),
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
                  )
                ],
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

class CategorySection extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategorySection({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Container(
            margin: EdgeInsets.only(
              left: AppDimens.large,
              right: AppDimens.medium,
            ),
            height: 61,
            width: 61,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppDimens.large,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(
                    255,
                    255,
                    166,
                    14,
                  ),
                  Color.fromARGB(
                    255,
                    255,
                    227,
                    200,
                  ),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ImageLoadingService(
                mainImage: categoryModel.image,
              ),
            )),
        Text(
          categoryModel.title,
          style: AppTextStyles.title,
        )
      ],
    );
  }
}
