import 'package:flutter/material.dart';
import 'package:guardian/new_entry/new_entry.dart';
import 'package:guardian/search/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:blobs/blobs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Image.asset('assets/login_page/Untitled.jpeg',
                  fit: BoxFit.fill),
            ),
            Positioned(
              top: 5,
              left: 560,
              child: Image.asset('assets/login_page/logo.png'),
            ),
            Positioned(
              left: 10.0,
              top: 10.0,
              height: 330.0,
              child: Image.asset(
                'assets/login_page/download.png',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    BouncingWidget(
                      duration: Duration(milliseconds: 200),
                      scaleFactor: 1.5,
                      onPressed: () {},
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 200),
                        padding: EdgeInsets.only(
                            top: (isHover) ? 25 : 30.0,
                            bottom: !(isHover) ? 25 : 30),
                        child: _homeButton(
                          "Add entry",
                          Icons.person_add_alt_rounded,
                          context,
                          const NewEntry(),
                        ),
                      ),
                    ),
                    _homeButton(
                      "Search",
                      Icons.person_pin_rounded,
                      context,
                      const Search(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _homeButton(String title, IconData icon, BuildContext context, Widget next) {
    double height1 = 200;
    double width1 = 200;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => next,
          ),
        );
      },
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      // child: Container(
      //   height: height1,
      //   width: width1,
      //   decoration: BoxDecoration(
      //     color: const Color(0xFFb002B5B),
      //     borderRadius: BorderRadius.circular(37),
      //   ),
      child: Blob.animatedRandom(
        size: 300,
        styles: BlobStyles(
          color: Color(0xFFebecfb),
          // fillType: BlobFillType.stroke,
          // strokeWidth: 3,
        ),
        edgesCount: 4,
        child: Column(
          children: [
            Icon(
              icon,
              size: 160,
              color: Color(0xFF051e4f),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF051e4f),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
