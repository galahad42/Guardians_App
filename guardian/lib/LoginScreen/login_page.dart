import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guardian/home.dart';
import './Components/input_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final List<Widget> loginContent;
  final TextEditingController _emailController = TextEditingController(),
                              _passwordController = TextEditingController();

  @override
  void initState() {
    loginContent = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Text(
          'Login',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ),
      // const SizedBox(height: 8),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Text(
          'I am a professional',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: const Color(0xFFBCBCBC),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const SizedBox(height: 8),
      InputField( hint: 'Email', iconData: Icons.mail_outline_rounded, controller: _emailController),
      InputField(hint: 'Password', iconData: Icons.lock_clock_outlined, controller: _passwordController),
      loginButton(),
    ];

    super.initState();
  }

  build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B5B),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                color: const Color(0xFF002B5B),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: loginContent,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/login_page/01.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/login_page/02.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/login_page/03.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.9,

                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 9 / 16,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        // viewportFraction: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () async {
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
          if(FirebaseAuth.instance.currentUser!.email != null) {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const Home()));
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          backgroundColor: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: const Text(
          "Sign in",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
            imgPath,
          ),
        ));
  }
}
