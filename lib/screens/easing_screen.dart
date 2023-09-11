import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EasingScreen extends HookWidget {
  const EasingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easing'),
      ),
      body: const Column(
        children: [
          _AlignmentAnimationWidget(Curves.easeOut),
          _AlignmentAnimationWidget(Curves.easeIn),
          _AlignmentAnimationWidget(Curves.easeInOut),
        ],
      ),
    );
  }
}

class _AlignmentAnimationWidget extends HookWidget {
  const _AlignmentAnimationWidget(this.curve);
  final Cubic curve;
  @override
  Widget build(BuildContext context) {
    final aliginment = useState(Alignment.topLeft);

    return AnimatedAlign(
      alignment: aliginment.value,
      duration: const Duration(milliseconds: 300),
      curve: curve,
      child: CupertinoButton(
        onPressed: () {
          aliginment.value = aliginment.value == Alignment.topLeft
              ? Alignment.topRight
              : Alignment.topLeft;
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
