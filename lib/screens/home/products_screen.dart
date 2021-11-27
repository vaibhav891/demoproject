import 'package:demoproject/data_models/category.dart';
import 'package:flutter/material.dart';

import 'widgets/explore/explore.dart';
import 'widgets/home_app_bar/home_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  final Category category;
  const ProductsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: MediaQuery.of(context).size.height,
      ),
      // bottomNavigationBar: BottomBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Explore(category: category),
        ],
      ),
    );
  }
}
