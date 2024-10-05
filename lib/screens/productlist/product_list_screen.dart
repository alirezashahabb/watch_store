import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/data/repo/product_repo.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/screens/productlist/bloc/productlist_bloc.dart';
import 'package:watch_store/widget/custom_appbar.dart';

class ProductListScreen extends StatelessWidget {
  final int pram;

  const ProductListScreen({super.key, required this.pram});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          var bloc = ProductsListBloc(productRepo);

          bloc.add(ProductListInitEvent(params: pram));
          return bloc;
        },
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: BlocBuilder<ProductsListBloc, ProductsListState>(
            builder: (context, state) {
              if (state is ProductsListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsListSuccessState) {
                return Column(
                  children: [
                    const TagsTitle(),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return const Text('سلام');
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is ProductsListErrorState) {
                return const Text('error');
              } else {
                throw Exception('state not support');
              }
            },
          ),
        ));
  }
}

class TagsTitle extends StatelessWidget {
  const TagsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimes.large),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: AppDimes.medium),
              padding: const EdgeInsets.symmetric(horizontal: AppDimes.medium),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(AppDimes.large)),
              child: const Text(
                'تستی',
                style: AppTextStyles.tagTitle,
              ),
            );
          },
        ),
      ),
    );
  }
}
