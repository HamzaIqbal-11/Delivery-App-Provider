import 'package:delivery_app/controller/homeController.dart';
import 'package:delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   // Path getClip(Size size) {
//   //   Path path = Path();
//   //   final double w = size.width;
//   //   final double h = size.height;
//   //   path.lineTo(0, h);
//   //   path.lineTo(w, h);
//   //   path.lineTo(w, 0);
//   //   path.close();
//   //   path.addOval(Rect.fromCircle(
//   //     center: Offset(w / 2, h - 20),
//   //     radius: 29.5,
//   //   ));
//   //   return path;
//   // }

//   // @override
//   // bool shouldReclip(CustomClipper<Path> oldClipper) => false;
//   Path getClip(Size size) {
//     final path = Path();

//     // Start from top-left
//     path.lineTo(0, 0);

//     // Draw line to bottom-left (just above where curve starts)
//     path.lineTo(0, size.height - 20);

//     // Draw the curved bottom
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - 30);

//     // Complete the rectangle
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
final homeProvider = Provider.of<HomeController>(customContext!, listen: false);

class customIconClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    path.addOval(Rect.fromCircle(
      center: Offset(w / 7, h - 60),
      radius: 32.5,
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customIconClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    path.addOval(Rect.fromCircle(
      center: Offset(w / 2, h - 60),
      radius: 32.5,
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customIconClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    path.addOval(Rect.fromCircle(
      center: Offset(w / 1.175, h - 60),
      radius: 32.5,
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
