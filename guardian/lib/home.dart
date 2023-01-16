import 'package:flutter/material.dart';
import 'package:guardian/new_entry/new_entry.dart';
import 'package:guardian/search/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: Color(0xFFF1F1F1),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _homeButton("Add entry", Icons.person_add_alt_rounded,
                        context, NewEntry()),
                    _homeButton(
                        "Search", Icons.person_pin_rounded, context, Search()),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Image.asset('assets/login_page/bottom1.png'),
            ),
          ],
        ),
      ),
    );
  }

  _homeButton(String title, IconData icon, BuildContext context, Widget next) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => next,
            ));
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xFFb002B5B),
          borderRadius: BorderRadius.circular(37),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 160,
              color: Color(0xFFF1F1F1),
            ),
            Text(
              title,
              style: TextStyle(color: Color(0xFFF1F1F1), fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
