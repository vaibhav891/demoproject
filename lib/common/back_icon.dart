import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
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
              Center(
                child: ClipPath(
                  clipper: HorizontalClipper(),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(-500, 0);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, (size.height / 2.0) - 0.7);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
