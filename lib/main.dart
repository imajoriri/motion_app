import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_app/screens/animated_builder_widget_screen.dart';
import 'package:motion_app/screens/animated_scale_widget_screen.dart';
import 'package:motion_app/screens/animation_controller_scale_widget_screen.dart';
import 'package:motion_app/screens/animation_screen.dart';
import 'package:motion_app/screens/custome_tween_widget_screen.dart';
import 'package:motion_app/screens/easing_screen.dart';
import 'package:motion_app/screens/interval_animation_widget_screen.dart';
import 'package:motion_app/screens/picture_in_picture_screen.dart';
import 'package:motion_app/screens/scale_transition_widget_screen.dart';
import 'package:motion_app/screens/spring_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomePage(title: 'Motion App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          child: Container(
            height: 200,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Center(
              child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CupertinoListSection(
        header: const Text('My Reminders'),
        children: <CupertinoListTile>[
          CupertinoListTile(
            title: const Text('Easing'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const EasingScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('Animation package'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const AnimationScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('Spring animation'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const SpringAnimationScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('picture in picture'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const PictureInPictureScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('Animated系(AnimatedScale)'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const AnimatedScaleWidgetScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('AnimationControllerを使った実装'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const AnimationControllerScaleWidgetScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('ScaleTransitionを使った実装'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const ScaleTransitionWidgetScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('AnimatedBuilderを使った実装'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const AnimatedBuilderWidgetScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('custome tweenを使った実装'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const CustomeTweenWidgetScreen();
                },
              ),
            ),
          ),
          CupertinoListTile(
            title: const Text('intervalを使った実装'),
            trailing: const CupertinoListTileChevron(),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return const IntervalAnimationWidgetScreen();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
