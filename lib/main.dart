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
              'Task 3: Party Face from Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [ 
                  CustomPaint(
                    painter: PartyHatPainter(),
                    size: const Size(double.infinity, 260),
                  ),
        
                  Image.network(
                  'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExb3B6bDl3aHZhdXI1eGN6cHhkODR3bno1cXRraGEzZ3dja241MzlzdiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/PotiYSwEnO33KX007a/giphy.gif',
                  width: 250,
                  height: 250,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 4: A 8-ball',
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

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final ovalOffset1 = Offset(centerX - 20, centerY - 20);
    final ovalOffset2 = Offset(centerX + 20, centerY - 20);
    final triangleOffset = Offset(centerX, centerY + 60);

    // Draws two ovals for the heart
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset1, width: 70, height: 70),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset2, width: 70, height: 70),
      paint,
    );

    // Draws a flipped triangle for the bottom part of the heart
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

    //left eye
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

    //right eye
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

    //left eye brow
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

    //right eye brow
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

    //mouth top
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
    
    //mouth bottom
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
    
    //hat
    final baseY = cy - 85;
    const dx = -170; 

    final baseLeft  = Offset(cx + 180 + dx, baseY);
    final baseRight = Offset(cx + 102 + dx, baseY + 30);
    final apex      = Offset(cx +  72 + dx, baseY - 60);

  
    final hat = Path()
      ..moveTo(apex.dx, apex.dy)
      ..lineTo(baseLeft.dx, baseLeft.dy)
      ..lineTo(baseRight.dx, baseRight.dy)
      ..close();

    
    final hatBounds = hat.getBounds(); 

    final hatFill = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB3E5FC), //light
          Color(0xFFFF4081), //dark
        ],
      ).createShader(hatBounds);

    final hatStroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawPath(hat, hatFill);
    canvas.drawPath(hat, hatStroke);


  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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

    // Draws the outer black circle
    final circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleOffset, 60, circlePaint);

    // Draws the inner white circle
    final circlePaint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleOffset1, 35, circlePaint1);

    // Draws the two black dots
    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(topDot, 12, dotPaint);

    final dotPaint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(bottomDot, 12, dotPaint);

    // Draws the two white dots inside the black dots
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
