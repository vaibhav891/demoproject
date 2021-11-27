import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    @required this.child,
    @required this.width,
    @required this.height,
    @required this.color,
  }) : super(key: key);
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 8, right: 16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            child!,
          ],
        ),
      ),
    );
  }
}
