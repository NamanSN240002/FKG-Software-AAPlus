import 'package:recommender_app/categories.dart';
import 'package:recommender_app/home_page.dart';
import 'package:recommender_app/item_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemList extends StatefulWidget {
  const CategoryItemList({super.key, required this.ret, required this.title_});
  final ret;
  final title_;
  @override
  State<CategoryItemList> createState() => _CategoryItemListState(ret, title_);
}

class _CategoryItemListState extends State<CategoryItemList> {
  _CategoryItemListState(this.ret, this.title_);
  final ret;
  final title_;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff23272C),
        title: Text(
          title_,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
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
                                        image: NetworkImage(ret[index]['image']
                                            .split(',')[0]
                                            .split(
                                                '\"')[1]), // Network image URL
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
                                "\$${ret[index]['discounted_price']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 15),
                              ),
                            ]),
                      ),
                    ));
              }),
        ],
      )),
    );
  }
}
