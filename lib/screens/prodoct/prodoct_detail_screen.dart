import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/prodoct/bloc/prodoct_detail_bloc.dart';
import 'package:watch_store/utils/image_loading_service.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/widgets/error_state.dart';

class ProdoctDetailScreen extends StatefulWidget {
  final int id;
  const ProdoctDetailScreen({super.key, required this.id});

  @override
  State<ProdoctDetailScreen> createState() => _ProdoctDetailScreenState();
}

class _ProdoctDetailScreenState extends State<ProdoctDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProdoctDetailBloc>(context).add(
      ProdoctDetailInitEvent(id: widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProdoctDetailBloc, ProdoctDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProdoctDetailSucessState) {
          return Scaffold(
            appBar: CustomAppBar(
                child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(Assets.svg.close),
                ),
                Expanded(
                  child: Text(
                    state.productDetailes.title!,
                    style: AppTextStyles.productTitle,
                  ),
                ),
                CartBadge(
                  count: 1,
                )
              ],
            )),
            body: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 8,
                      children: [
                        ImageLoadingService(
                          mainImage: state.productDetailes.image!,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppDimens.small,
                              ),
                              color: AppColors.searchBar,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Text(
                                    'متن تستی',
                                    style: AppTextStyles.productTitle,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Text(
                                    'ای لشسکر صاحب زمان اماده باشس اماده باش !',
                                    style: AppTextStyles.caption,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Divider(),
                                  ProdoctTabView(),
                                  60.0.height,
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.blue,
                    height: 60,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProdoctDetailErrorState) {
          return ErrorScreen(
            onTap: () {
              context.read<ProdoctDetailBloc>().add(ProdoctDetailInitEvent(
                    id: widget.id,
                  ));
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ProdoctTabView extends StatefulWidget {
  const ProdoctTabView({super.key});

  @override
  State<ProdoctTabView> createState() => _ProdoctTabViewState();
}

class _ProdoctTabViewState extends State<ProdoctTabView> {
  var slectedTapIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width / taps.length,
            itemCount: taps.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() => slectedTapIndex = index);
                },
                child: Container(
                  padding: EdgeInsets.all(
                    AppDimens.medium,
                  ),
                  child: Text(
                    taps[index],
                    style: index == slectedTapIndex
                        ? AppTextStyles.selectedTab
                        : AppTextStyles.unSelectedTab,
                  ),
                ),
              );
            },
          ),
        ),
        IndexedStack(
          index: slectedTapIndex,
          children: [
            ReviewProducts(),
            FutureProducts(),
            CommentsProdocts(),
          ],
        )
      ],
    );
  }
}

List<String> taps = [
  'نقد برسی',
  'نظرات',
  'خصوصیات',
];

class FutureProducts extends StatelessWidget {
  const FutureProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ReviewProducts extends StatelessWidget {
  const ReviewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CommentsProdocts extends StatelessWidget {
  const CommentsProdocts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
