import 'package:flutter/material.dart';
import 'package:tracker_annotations/tracker_annotations.dart';

part 'sign_up_page.trackable.dart';

@trackable
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with _$SignUpPageMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
