import 'package:demoproject/common/drawer_icon.dart';
import 'package:flutter/material.dart';

import 'search.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final num height;
  const HomeAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height * 0.15);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0, top: 16.0),
        child: DrawerIcon(),
      ),
      bottom: BottomAppBar(height: height),
    );
  }
}

class BottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final num height;
  const BottomAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height as double);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Search(),
        SizedBox(height: 20),
        // HomeTabBar(),
        // const SizedBox(height: 4),
      ],
    );
  }
}
