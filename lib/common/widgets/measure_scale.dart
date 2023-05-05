import 'package:flutter/material.dart';

class MeasureScale extends StatelessWidget {
  final int divisions;
  final double height;

  const MeasureScale(
      {super.key, required this.divisions, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter: MeasureScalePainter(height: height, divisions: divisions),
      ),
    );
  }
}

class MeasureScalePainter extends CustomPainter {
  final double height;
  final int divisions;

  MeasureScalePainter({required this.height, required this.divisions});

  @override
  void paint(Canvas canvas, Size size) {
    var containerPaint = Paint()
      ..color = const Color.fromARGB(255, 42, 63, 91)
      ..strokeWidth = 8;
    Offset start = const Offset(0, 0);
    Offset end = Offset(0, size.height);

    canvas.drawLine(
      start,
      end,
      containerPaint,
    );
    final Paint linePaint = Paint()
      ..color = const Color.fromARGB(255, 42, 63, 91)
      ..strokeWidth = 1.0;

    final double unitHeight = height / divisions;

    for (int i = 0; i < divisions; i++) {
      final double y = i * unitHeight;
      final Offset p1 = Offset(0, y);
      var p2obs = const Offset(0, 0);
      if (i % 5 == 0 && i != 0) {
        p2obs = Offset(size.width * 0.05, y);
      } else {
        p2obs = Offset(size.width * 0.02, y);
      }
      final Offset p2 = p2obs;
      canvas.drawLine(p1, p2, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
