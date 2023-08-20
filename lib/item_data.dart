import 'package:recommender_app/category_itemlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable/expandable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemData extends StatelessWidget {
  const ItemData({super.key, required this.data});
  final Map<dynamic, dynamic> data;
  _launchURLBrowser(url) async {
    launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                // color: Colors.pink,
                width: double.infinity,
                height: 350,
                child: FadeInImage(
                  placeholder:
                      AssetImage('lib/console.png'), // Placeholder image
                  image: NetworkImage(data['image']
                      .split(',')[0]
                      .split('\"')[1]), // Network image URL
                  fit: BoxFit
                      .contain, // How the image should be fitted within the widget
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                margin: EdgeInsets.only(top: 230),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                data['product_name'],
                                style: GoogleFonts.poppins(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                                softWrap: false,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "\$${data['discounted_price']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      ExpandableNotifier(
                        // <-- Provides ExpandableController to its children
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expandable(
                              // <-- Driven by ExpandableController from ExpandableNotifier
                              collapsed: ExpandableButton(
                                  // <-- Expands when tapped on the cover photo
                                  child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Description',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              )),
                              expanded: Column(children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  child: Text(
                                    data['description'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                ),
                                ExpandableButton(
                                  // <-- Collapses when tapped on
                                  child: Icon(Icons.keyboard_arrow_up),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Find this product on Flipkart!',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                          ),
                          onPressed: () {
                            _launchURLBrowser(Uri.parse(data['url']));
                          },
                          child: Text(
                            "Link to FlipKart!",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
