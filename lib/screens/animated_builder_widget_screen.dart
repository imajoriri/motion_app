import 'package:flutter/material.dart';

class AnimatedBuilderWidgetScreen extends StatefulWidget {
  const AnimatedBuilderWidgetScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBuilderWidgetScreennState createState() =>
      _AnimatedBuilderWidgetScreennState();
}

class _AnimatedBuilderWidgetScreennState
    extends State<AnimatedBuilderWidgetScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final CurvedAnimation curveController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    // reverseもeaseOutExpoにするためにCurvedAnimationを使う
    curveController = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutExpo,
        reverseCurve: Curves.easeInExpo);
    animation = curveController.drive(Tween(begin: 1.0, end: 0.5));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationControllerScaleWidget'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: animation.value,
              child: child,
            );
          },
          child: GestureDetector(
            onTapDown: (details) {
              controller.forward();
            },
            onTapUp: (details) {
              controller.reverse();
            },
            onTapCancel: () {
              controller.reverse();
            },
            onTap: () {
              // 500ms後にSnackBarを表示
              Future.delayed(const Duration(milliseconds: 500), () {
                const snackBar = SnackBar(
                  content: Text('tapped!!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
