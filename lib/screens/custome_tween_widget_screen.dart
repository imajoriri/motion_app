import 'package:flutter/material.dart';

class CustomeTweenWidgetScreen extends StatefulWidget {
  const CustomeTweenWidgetScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomeTweenWidgetScreenState createState() =>
      _CustomeTweenWidgetScreenState();
}

class _CustomeTweenWidgetScreenState extends State<CustomeTweenWidgetScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation =
        controller.drive(_CustomeTween(begin: Colors.red, end: Colors.blue));
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
              color: animation.value,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

// 前半はbeginの色、後半はendの色になるTween
class _CustomeTween extends Tween<Color> {
  _CustomeTween({
    required Color begin,
    required Color end,
  }) : super(begin: begin, end: end);

  @override
  Color lerp(double t) {
    if (t < 0.5) {
      return begin!;
    } else {
      return end!;
    }
  }
}
