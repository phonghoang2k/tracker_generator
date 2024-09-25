import 'package:example/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:tracker_annotations/tracker_annotations.dart';

part 'sign_in_page.trackable.dart';

@Trackable(
  referrer: "asdasdas"
)
class SignInPage extends StatefulWidget {
  final String name;
  final double version;
  final Map<String, dynamic> properties;
  final String _b;

  const SignInPage(
    this._b, {
    Key? key,
    required this.name,
    required this.version,
    required this.properties,
    bool z = true,
  }) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> with _$SignInPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
          },
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
