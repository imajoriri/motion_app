import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PictureInPictureScreen extends StatefulWidget {
  const PictureInPictureScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PictureInPictureScreen createState() => _PictureInPictureScreen();
}

class _PictureInPictureScreen extends State<PictureInPictureScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  double animateStartLeft = 0.0;
  double animateStartTop = 0.0;
  double left = 0.0;
  double top = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          left = animateStartLeft * controller.value + 10;
          top = animateStartTop * controller.value + 10;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picture in Picture')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: left,
            top: top,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  left += details.delta.dx;
                  top += details.delta.dy;
                });
              },
              onPanEnd: (details) {
                animateStartLeft = left;
                animateStartTop = top;

                final pixelsPerSecond = details.velocity.pixelsPerSecond;

                final unitsPerSecondX =
                    pixelsPerSecond.dx / MediaQuery.of(context).size.width;
                final unitsPerSecondY =
                    pixelsPerSecond.dy / MediaQuery.of(context).size.height;
                final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
                final unitVelocity = unitsPerSecond.distance;
                final simulation = SpringSimulation(
                  const SpringDescription(
                    mass: 1,
                    stiffness: 100,
                    damping: 15,
                  ),
                  1,
                  0.0,
                  unitVelocity * -1,
                );
                controller.animateWith(simulation);
              },
              child: Container(
                  width: 100,
                  height: 100,
                  // 角丸
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
