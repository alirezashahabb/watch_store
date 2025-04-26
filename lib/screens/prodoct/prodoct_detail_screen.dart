import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
                  onPressed: () {},
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
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
