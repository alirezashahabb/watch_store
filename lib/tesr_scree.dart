import 'package:flutter/material.dart';
import 'package:watch_store/constant/endpoinst.dart';
import 'package:watch_store/data/repositroy/product_repostroy.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Test'),
          ElevatedButton(
              onPressed: () {
                ProdoctRepo().getPro();
              },
              child: Text('getData'))
        ],
      ),
    );
  }
}

class ProdoctRepo {
  final product = ProductRepostroy();
  getPro() async {
    await product.getSoetrd(ProductSortRoutes.newestProducts);
  }
}
