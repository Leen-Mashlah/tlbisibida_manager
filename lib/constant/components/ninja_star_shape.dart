import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

class NinjaStarShape extends StatelessWidget {
  const NinjaStarShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: cyan300,
                    ),
                    clipper: _Triangle(),
                  ),
                  Transform.rotate(
                    angle: 180 * pi / 180,
                    child: ClipPath(
                      child: Container(
                        width: 300,
                        height: 300,
                        color: cyan300,
                      ),
                      clipper: _Triangle(),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -90 * pi / 180,
                    child: ClipPath(
                      child: Container(
                        width: 300,
                        height: 300,
                        color: cyan300,
                      ),
                      clipper: _Triangle(),
                    ),
                  ),
                  Transform.rotate(
                    angle: 90 * pi / 180,
                    child: ClipPath(
                      child: Container(
                        width: 300,
                        height: 300,
                        color: cyan300,
                      ),
                      clipper: _Triangle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Triangle extends CustomClipper<Path> {
  // _Triangle(int x,int y){}
  @override
  Path getClip(Size size) {
    final Path path = Path();
    //0,0
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, 0);
    // path.lineTo(size.width/2, 0);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    //   path.lineTo(size.width / 2, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
