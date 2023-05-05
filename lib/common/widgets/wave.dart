import 'package:flutter/material.dart';
import 'dart:math' as math;

class Wave extends StatefulWidget {
  final double value;
  final Color color;
  final double height;
  final double moveOffset;
  final bool isTurbulent;
  final bool alternate;

  const Wave({
    Key? key,
    required this.height,
    required this.value,
    required this.color,
    required this.moveOffset,
    required this.isTurbulent,
    this.alternate = false,
    // required this.direction,
  }) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      value: widget.value,
      vsync: this,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) => ClipPath(
        clipper: DrawClip(
          _animationController.value,
        ),
        child: Container(
          height: widget.height,
          color: widget.color,
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.2);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.2 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
