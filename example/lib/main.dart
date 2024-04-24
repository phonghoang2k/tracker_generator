import 'package:example/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:tracker_annotations/tracker_annotations.dart';

class MyObserver extends TrackerObserver {
  const MyObserver();

  @override
  void onEnter(TrackerEventData event) {
    print('onEnter: $event');
  }

  @override
  void onExit(TrackerEventData event) {
    print('onExit: $event');
  }
}

void main() {
  runApp(const MyApp());

  Trackable.observer = const MyObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(
        'b',
        name: 'name',
        properties: {'key': 'value'},
        version: 1.0,
      ),
    );
  }
}
