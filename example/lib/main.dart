import 'package:example/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:tracker_flutter_annotations/tracker_flutter_annotations.dart';

void main() {
  runApp(const MyApp());
  TrackerFlutterGlobal()
    ..setAppId('appId')
    ..setUserId("aaaa")
    ..setPrefix('fnb');
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
