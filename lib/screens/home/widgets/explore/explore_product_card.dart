import 'package:demoproject/common/product_card.dart';
import 'package:demoproject/data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreProductCard extends StatelessWidget {
  const ExploreProductCard({Key? key}) : super(key: key);

  Color textColor(Product product) {
    switch (product.backgroundColor) {
      case 0xFF4769F4:
      case 0xFFA26FFF:
        return Colors.white;
      case 0xFFFFFFFF:
        return const Color(0xFFA26FFF);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of(context);
    return ProductCard(
      width: 150,
      height: 250,
      color: Color(product.backgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 30,
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor(product),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 115,
            width: 130,
            alignment: Alignment.topCenter,
            child: Hero(
              tag: product.uid,
              child: Image.network(
                product.defaultPhoto,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 12),
            height: 20,
            child: Text(
              "₹" +
                  product.minPrice.toStringAsFixed(0) +
                  ' - ' +
                  product.maxPrice.toStringAsFixed(0),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: textColor(product).withAlpha(200),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 12),
            height: 10,
            child: Text(
              'Available in - ' + product.colors.toString(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                color: textColor(product).withAlpha(200),
              ),
            ),
          ),
          if (product.sizes.isNotEmpty)
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 12),
              height: 10,
              child: Text(
                'Sizes available - ' + product.sizes.toString(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: textColor(product).withAlpha(200),
                ),
              ),
            )
        ],
      ),
    );
  }
}
