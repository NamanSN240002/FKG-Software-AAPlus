// ignore_for_file: no_logic_in_create_state

import 'package:recommender_app/loader2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final cl = [
    "Clothing",
    "Jewellery",
    "Footwear",
    "Mobiles & Accessories",
    "Automotive",
    "Home Decor & Festive Needs",
    "Beauty and Personal Care",
    "Home Furnishing",
    "Kitchen & Dining",
    "Computers",
    "Watches"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff23272C),
          title: Text(
            'Categories',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cl.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Loading(category: cl[index]))),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            width: 20,
                            child: Image.asset('lib/dress.png', height: 35),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(cl[index],
                                    style: GoogleFonts.poppins(
                                        letterSpacing: 1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              width: 20,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}
