import 'package:demoproject/data_models/category.dart';
import 'package:demoproject/data_models/product.dart';
import 'package:demoproject/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'explore_product_card.dart';

class Explore extends StatelessWidget {
  final Category category;
  const Explore({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ExploreProductList(
            category: category,
          ),
        ],
      ),
    );
  }
}

class ExploreProductList extends StatefulWidget {
  final Category category;
  const ExploreProductList({Key? key, required this.category})
      : super(key: key);

  @override
  _ExploreProductListState createState() => _ExploreProductListState();
}

class _ExploreProductListState extends State<ExploreProductList> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scrollToStart(ScrollController controller) {
    if (controller.hasClients) {
      controller.animateTo(
        0,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppStore store = Provider.of(context);
    return Observer(
        name: "Explore Products Observer",
        builder: (context) {
          var products = store.filteredProducts.where((element) {
            if (widget.category.uid == element.category.toString()) {
              return true;
            } else if (widget.category.childCategory.isNotEmpty) {
              if (widget.category.childCategory.contains(element.category)) {
                return true;
              } else {
                var child = store.categories
                    .where((element) => widget.category.childCategory
                        .contains(int.parse(element.uid!)))
                    .toList();
                for (var item in child) {
                  if (item.childCategory.isNotEmpty &&
                      item.childCategory.contains(element.category)) {
                    return true;
                  }
                }
                return false;
              }
            } else {
              return false;
            }
          }).toList();
          scrollToStart(controller);
          return GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            padding: const EdgeInsets.only(left: 32.0),
            physics: const BouncingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            controller: controller,
            children: products.isNotEmpty
                ? products.map((Product product) {
                    return Provider<Product>.value(
                      value: product,
                      child: const ExploreProductCard(),
                    );
                  }).toList()
                : [const Text('no products')],
          );
        });
  }
}
