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
                child: Image.network(
                  data['image']
                      .split(',')[1]
                      .substring(2, data['image'].split(',')[1].length - 1),
                  fit: BoxFit.cover,
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
                              data['discounted_price'].toString(),
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
                        child: TextButton(
                          onPressed: () {
                            _launchURLBrowser(Uri.parse(data['url']));
                          },
                          child: Text(
                            data['url'],
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
