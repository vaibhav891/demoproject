import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.white.withAlpha(60),
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 50,
          child: Stack(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white.withAlpha(60),
                ),
              ),
              const Center(
                child: Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
