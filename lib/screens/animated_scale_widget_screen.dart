import 'package:flutter/material.dart';

class AnimatedScaleWidgetScreen extends StatefulWidget {
  const AnimatedScaleWidgetScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedScaleWidgetScreenState createState() =>
      _AnimatedScaleWidgetScreenState();
}

class _AnimatedScaleWidgetScreenState extends State<AnimatedScaleWidgetScreen> {
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedScaleWidget'),
      ),
      body: Center(
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: GestureDetector(
            onTapDown: (details) {
              setState(() {
                scale = 0.5;
              });
            },
            onTapUp: (details) {
              setState(() {
                scale = 1.0;
              });
            },
            onTapCancel: () {
              setState(() {
                scale = 1.0;
              });
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
