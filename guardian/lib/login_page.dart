import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF002B5B),
                child: Body(),
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image(
                  image: AssetImage('login_page/01.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
