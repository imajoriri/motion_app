import 'package:flutter/material.dart';

class IntervalAnimationWidgetScreen extends StatefulWidget {
  const IntervalAnimationWidgetScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IntervalAnimationWidgetScreenState createState() =>
      _IntervalAnimationWidgetScreenState();
}

class _IntervalAnimationWidgetScreenState
    extends State<IntervalAnimationWidgetScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;
  late final Animation intervalAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = controller.drive(Tween(begin: 1.0, end: 0.5));
    intervalAnimation = controller
        // 0.7~1.0の間でアニメーションを行う。少し遅れてアニメーションを開始する
        .drive(CurveTween(curve: const Interval(0.7, 1.0)))
        .drive(Tween(begin: 1.0, end: 0.5));
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
        child: Column(
          children: [
            Transform.scale(
              scale: intervalAnimation.value,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Transform.scale(
              scale: animation.value,
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
          ],
        ),
      ),
    );
  }
}
