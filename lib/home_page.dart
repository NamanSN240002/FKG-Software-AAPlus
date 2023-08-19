import 'package:recommender_app/categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/item_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.ret});
  final ret;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridKart"),
        backgroundColor: Color(0xff23272C),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xff23272C)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    color: Color(0xffFEDA7A),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.chat_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                ),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color(0xffFEDA7A),
              // showUnselectedLabels: true,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Category())),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.category_rounded,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'All',
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'lib/dress.png',
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Clothing')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'lib/sunglasses.png',
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Accessories')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset('lib/handbag.png', height: 35),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Bags')
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      width: 20,
                      child: Icon(
                        Icons.discount_outlined,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('50% OFF',
                              style: GoogleFonts.poppins(
                                  letterSpacing: 4,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700)),
                          Text('on all women\'s shoes',
                              style: TextStyle(wordSpacing: 1))
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: 20,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Recommended for You!',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  itemCount: ret.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // new line
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: ItemData(data: ret[index]))),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'lib/console.png',
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: CircleAvatar(
                                              foregroundColor: Colors.black,
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.favorite)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    ret[index]['product_name'],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    ret[index]['discounted_price'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15),
                                  ),
                                ]),
                          ),
                        ));
                  }),
              SizedBox(
                height: 80,
              )
            ]),
      ),
    );
  }
}
