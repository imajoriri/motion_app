import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringAnimationScreen extends StatefulWidget {
  const SpringAnimationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpringAnimationScreen createState() => _SpringAnimationScreen();
}

class _SpringAnimationScreen extends State<SpringAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final SpringSimulation simulation;
  late final Animation animation;

  @override
  void initState() {
    super.initState();

    simulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 0.5,
      ),
      0.0, // starting point
      100.0, // ending point
      10, // velocity
    );

    controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {});
      });

    animation = controller.drive(
      RelativeRectTween(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spring')),
      body: Stack(
        children: [
          Positioned.fill(
            top: controller.value,
            child: Center(
              child: ElevatedButton(
                child: const Text("Press me"),
                onPressed: () {
                  controller.animateWith(simulation);
                },
              ),
            ),
          ),
          // AnimatedBuilder(
          //     animation: animation,
          //     builder: (context, child) {
          //       return Positioned.fill(
          //         top: controller.value,
          //         child: Center(
          //           child: ElevatedButton(
          //             child: const Text("Press me"),
          //             onPressed: () {
          //               controller.animateWith(simulation);
          //             },
          //           ),
          //         ),
          //       );
          //     }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
