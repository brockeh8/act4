import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ShapesDemoApp());
}

class ShapesDemoApp extends StatelessWidget {
  const ShapesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapes Drawing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ShapesDemoScreen(),
    );
  }
}

class ShapesDemoScreen extends StatelessWidget {
  const ShapesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapes Drawing Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task 1: Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BasicShapesPainter(),
                size: const Size(double.infinity, 200),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 2: A Heart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: HeartPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 3: A 8-ball',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: BallPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final squareOffset = Offset(centerX - 80, centerY);
    final circleOffset = Offset(centerX, centerY);
    final arcOffset = Offset(centerX + 80, centerY);
    final rectOffset = Offset(centerX - 160, centerY);
    final lineStart = Offset(centerX - 200, centerY - 50);
    final lineEnd = Offset(centerX - 140, centerY + 50);
    final ovalOffset = Offset(centerX + 5, centerY);

    // Draw a square
    final squarePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: squareOffset, width: 60, height: 60),
      squarePaint,
    );

    // Draw a circle
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 30, circlePaint);

    // Draw an arc
    final arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: arcOffset, width: 60, height: 60),
      0, // start angle in radians
      2.1, // sweep angle in radians (about 120 degrees)
      false, // whether to use center
      arcPaint,
    );

    // Draw a rectangle
    final rectPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: rectOffset, width: 80, height: 40),
      rectPaint,
    );

    // Draw a line
    final linePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3;
    canvas.drawLine(lineStart, lineEnd, linePaint);

    // Draw an oval
    final ovalPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset, width: 80, height: 40),
      ovalPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Offsets for ovals
    final ovalOffset1 = Offset(centerX - 20, centerY - 20);
    final ovalOffset2 = Offset(centerX + 20, centerY - 20);

    // Offset for the top point of the triangle
    final triangleOffset = Offset(centerX, centerY + 60);

    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw left oval
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset1, width: 70, height: 70),
      paint,
    );

    // Draw right oval
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset2, width: 70, height: 70),
      paint,
    );

    // Draw triangle (bottom of the heart)
    final path = Path()
      ..moveTo(triangleOffset.dx, triangleOffset.dy)
      ..lineTo(triangleOffset.dx - 50, triangleOffset.dy - 60)
      ..lineTo(triangleOffset.dx + 50, triangleOffset.dy - 60)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}




class BallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset1 = Offset(centerX, centerY - 50);
    final circleOffset = Offset(centerX, centerY - 50);
    final topDot = Offset(centerX, centerY - 60);
    final bottomDot = Offset(centerX, centerY - 40);
    final insideDot = Offset(centerX, centerY - 60);
    final insideDot1 = Offset(centerX, centerY - 40);

    final circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleOffset, 60, circlePaint);

    final circlePaint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleOffset1, 35, circlePaint1);

    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(topDot, 12, dotPaint);

    final dotPaint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(bottomDot, 12, dotPaint);

    final insidePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
    
    canvas.drawCircle(insideDot, 6, insidePaint);

    final insidePaint1 = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
    
    canvas.drawCircle(insideDot1, 6, insidePaint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

