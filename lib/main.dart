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
      title: 'Activity 4',
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
        title: const Text('Activity 4'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Task 1: Smiley Face from Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: CustomPaint(
                painter: SmileyFacePainter(),
                size: const Size(double.infinity, 260),
              ),
            ),

            // const SizedBox(height: 20),
            // const Text(
            //   'Task 2: Heart from basic shapes',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // SizedBox(
            //   height: 260,
            //   child: CustomPaint(
            //     painter: (),
            //     size: const Size(double.infinity, 260),
            //   ),
            // ),

            const SizedBox(height: 20),
            const Text(
              'Task 3: Party Face from Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: Stack(
                children: [ 
                  CustomPaint(
                    painter: PartyHatPainter(),
                    size: const Size(double.infinity, 260),
                  ),

                  Image.asset(
                   "https://usagif.com/wp-content/uploads/gif/confetti-43.gif",
                    height: 125.0,
                    width: 125.0,

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


class SmileyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final center = Offset(cx, cy);

  
    //face
    final circlePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 90, circlePaint);

    //eyes
    final eye = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final leftEyeRect  = Rect.fromCenter(center: Offset(cx - 30, cy - 25), width: 18, height: 29);
    final rightEyeRect = Rect.fromCenter(center: Offset(cx + 30, cy - 25), width: 18, height: 29);
    canvas.drawOval(leftEyeRect, eye);   
    canvas.drawOval(rightEyeRect, eye);  


    //smile
    
    final smile = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx, cy + 15), width: 120, height: 90),
      0.3, // start angle in radians
      2.6, // sweep angle in radians (about 120 degrees)
      false, 
      smile,
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PartyHatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final center = Offset(cx, cy);

  
    //face
    final face = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 90, face);

    final leftEye = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx - 30, cy - 25), width: 18, height: 29),
      0.6, // start angle in radians
      1.8, // sweep angle in radians (about 120 degrees)
      false, 
      leftEye,
    );

    final rightEye = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx + 30, cy - 25), width: 18, height: 29),
      0.6, // start angle in radians
      1.8, // sweep angle in radians (about 120 degrees)
      false, 
      rightEye,
    );

    final leftEyeBrow = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx - 43, cy - 25), width: 18, height: 29),
      3.26, // start angle in radians
      1.88, // sweep angle in radians (about 120 degrees)
      false, 
      leftEyeBrow,
    );

    final rightEyeBrow = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx + 43, cy - 25), width: 18, height: 29),
      4.24, // start angle in radians
      1.88, // sweep angle in radians (about 120 degrees)
      false, 
      rightEyeBrow,
    );

    final mouthTop = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx - 6, cy + 20), width: 25, height: 20),
      pi * 0.4, // start angle in radians
      pi * 0.95, // sweep angle in radians (about 120 degrees)
      false, 
      mouthTop,
    );

    final mouthBottom = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx - 6, cy + 36), width: 34, height: 18),
      pi * 0.4, // start angle in radians
      pi * 0.95, // sweep angle in radians (about 120 degrees)
      false, 
      mouthBottom,
    );
    
    final baseY = cy - 85;
    const dx = -170;
    final baseLeft  = Offset(cx + 180 + dx,  baseY);
    final baseRight = Offset(cx + 102 + dx, baseY + 30);
    final apex      = Offset(cx + 72 + dx,  baseY - 60);

    final hatFill = Paint()
      ..color = Colors.orange.shade300   // bland, muted orange
      ..style = PaintingStyle.fill;
    final hatStroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final hat = Path()
      ..moveTo(apex.dx, apex.dy)
      ..lineTo(baseLeft.dx, baseLeft.dy)
      ..lineTo(baseRight.dx, baseRight.dy)
      ..close();

    canvas.drawPath(hat, hatFill);
    canvas.drawPath(hat, hatStroke);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

  
