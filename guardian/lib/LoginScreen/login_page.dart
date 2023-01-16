import 'package:flutter/material.dart';
import './Components/input_field.dart';
import './Components/login_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final List<Widget> loginContent;
  // final List<String> images = [
  //   "assets/login_page/01.png",
  //   "assets/login_page/02.png",
  //   "assets/login_page/03.png",
  // ];

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
      const InputField(hint: 'Email', iconData: Icons.mail_outline_rounded),
      const InputField(hint: 'Password', iconData: Icons.lock_clock_outlined),
      const LoginButton(title: 'Log In'),
    ];

    super.initState();
  }

  Widget build(BuildContext context) {
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
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/login_page/01.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/login_page/02.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/login_page/03.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        //TODO - set height to parentHeight*0.45
                        height: 750,

                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 9 / 16,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
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
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
            imgPath,
          ),
        ));
  }
}
