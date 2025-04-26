import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/productlist/bloc/prodoct_list_bloc.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/product_items.dart';
import 'package:watch_store/widgets/tag_list_screen.dart';

class ProductListScreen extends StatefulWidget {
  final int id;
  const ProductListScreen({
    super.key,
    required this.id,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProdoctListBloc>(context)
        .add(ProdoctListInitEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("پرفروشترین ها"),
              AppDimens.small.width,
              SvgPicture.asset(Assets.svg.sort)
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(Assets.svg.close)),
        ],
      )),
      body: BlocBuilder<ProdoctListBloc, ProdoctListState>(
        builder: (context, state) {
          if (state is ProdoctLisLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProdoctLisResponseState) {
            return Column(
              children: [
                TagList(),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      var items = state.product[index];
                      return ProductItems(
                        price: '${items.price}',
                        productName: items.title!,
                        discount: items.discount,
                        oldPrice: items.discountPrice,
                        specialExpiration: items.specialExpiration,
                        image: items.image!,
                        id: items.id!,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ProdoctLisErrorState) {
            return Text(state.error);
          } else {
            throw Exception('state is not support');
          }
        },
      ),
    );
  }
}
