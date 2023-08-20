import 'package:recommender_app/categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/item_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.ret, required this.user});
  final ret;
  final user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_cart_checkout, size: 18, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "GRIDKART",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff23272C),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Category())),
                        child: const Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.category_rounded,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'All Products!',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
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
                                        child: Container(
                                          height: 100,
                                          child: FadeInImage(
                                            placeholder: AssetImage(
                                                'lib/console.png'), // Placeholder image
                                            image: NetworkImage(ret[index]
                                                        ['image']
                                                    .split(',')[0]
                                                    .split('\"')[
                                                1]), // Network image URL
                                            fit: BoxFit
                                                .scaleDown, // How the image should be fitted within the widget
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: CircleAvatar(
                                              foregroundColor:
                                                  Color.fromARGB(255, 14, 1, 1),
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
                                    "\$${ret[index]['discounted_price']}",
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
