import 'package:flutter/material.dart';
import 'package:watch_store/data/repo/product_repo.dart';
import 'package:watch_store/data/src/product_data_source.dart';

class RepoTest extends StatelessWidget {
  const RepoTest({super.key});

  @override
  Widget build(BuildContext context) {
    final prdoct = ProductRepo(ProductDataSource());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var show = await prdoct.getAllMostViewProducts();
          },
          child: const Text('getData'),
        ),
      ),
    );
  }
}
