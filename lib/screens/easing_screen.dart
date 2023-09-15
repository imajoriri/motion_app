import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EasingScreen extends HookWidget {
  const EasingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = useState(const Duration(milliseconds: 200));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easing'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.0, 0.0, 1.0, 1.0),
                  title: "linear",
                  color: Colors.yellow,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.2, 0.0, 0.0, 1.0),
                  title: "standard",
                  color: Colors.blue,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.3, 0.0, 1.0, 1.0),
                  title: "standard accelerate",
                  color: Colors.blue,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.0, 0.0, 0.0, 1.0),
                  title: "standard decelerate",
                  color: Colors.blue,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.2, 0, 0, 1),
                  title: "emphasized",
                  color: Colors.pink,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.3, 0, 0.8, 0.15),
                  title: "emphasized accelerate",
                  color: Colors.pink,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: const Cubic(0.05, 0.7, 0.1, 1.0),
                  title: "emphasized decelerate",
                  color: Colors.pink,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeOut,
                  title: "easeOut",
                  color: Colors.green,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeOutExpo,
                  title: "easeOut Expo",
                  color: Colors.green,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeOutSine,
                  title: "easeOut easeOutSine",
                  color: Colors.green,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeIn,
                  title: "easeIn",
                  color: Colors.orange,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeInExpo,
                  title: "easeInExpo",
                  color: Colors.orange,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeInSine,
                  title: "easeInSine",
                  color: Colors.orange,
                  duration: duration.value,
                ),
                _AlignmentAnimationWidget(
                  curve: Curves.easeInOut,
                  title: "easeInOut",
                  color: Colors.blue,
                  duration: duration.value,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              height: 100,
              // checkboxを横並びで3つ
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeCheckBox(
                    title: "200ms",
                    duration: const Duration(milliseconds: 200),
                    onChanged: (value) {
                      duration.value = value;
                    },
                    checked: duration.value.inMilliseconds == 200,
                  ),
                  TimeCheckBox(
                    title: "300ms",
                    duration: const Duration(milliseconds: 300),
                    onChanged: (value) {
                      duration.value = value;
                    },
                    checked: duration.value.inMilliseconds == 300,
                  ),
                  TimeCheckBox(
                    title: "400ms",
                    duration: const Duration(milliseconds: 400),
                    onChanged: (value) {
                      duration.value = value;
                    },
                    checked: duration.value.inMilliseconds == 400,
                  ),
                  TimeCheckBox(
                    title: "500ms",
                    duration: const Duration(milliseconds: 500),
                    onChanged: (value) {
                      duration.value = value;
                    },
                    checked: duration.value.inMilliseconds == 500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeCheckBox extends HookWidget {
  final String title;
  final Duration duration;
  final ValueChanged<Duration> onChanged;
  final bool checked;
  const TimeCheckBox({
    super.key,
    required this.title,
    required this.duration,
    required this.onChanged,
    required this.checked,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.blue,
          value: checked,
          onChanged: (value) {
            onChanged(duration);
          },
        ),
        Text(title),
      ],
    );
  }
}

class _AlignmentAnimationWidget extends HookWidget {
  final Curve curve;
  final String title;
  final Color color;
  final Duration duration;
  const _AlignmentAnimationWidget({
    required this.curve,
    required this.title,
    required this.color,
    required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    final aliginment = useState(Alignment.topLeft);
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          AnimatedAlign(
            alignment: aliginment.value,
            duration: duration,
            curve: curve,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                aliginment.value = aliginment.value == Alignment.topLeft
                    ? Alignment.topRight
                    : Alignment.topLeft;
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
