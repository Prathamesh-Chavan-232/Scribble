import 'package:flutter/material.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
          painter: Sky(),
          child: const Center(
            child: Text(
              'Once upon a time...',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        )
    );
  }
}
class Sky extends CustomPainter {
  @override

  void paint(Canvas canvas, Size size) {
    // 1
    Paint paint = Paint()..style = PaintingStyle.stroke;
    // 2
    Path path = Path();
    // 3
    path.moveTo(0, 250); //(x,y)
    path.lineTo(100, 200);
    path.lineTo(150, 150);
    path.lineTo(200, 50);
    path.lineTo(250, 150);
    path.lineTo(300, 200);
    path.lineTo(size.width, 250);
    path.lineTo(0, 250);

    // 4
    path.moveTo(100, 100);
    path.addOval(Rect.fromCircle(center: Offset(0, 250), radius: 25));  //offset is the center point of the circle

    // 5
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}