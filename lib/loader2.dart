import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/categories.dart';
import 'package:recommender_app/category_itemlist.dart';
import 'package:recommender_app/utilities/apiservices.dart';

class Loading extends StatefulWidget {
  const Loading({super.key, required this.category});
  final category;
  @override
  State<Loading> createState() => _LoadingState(category);
}

class _LoadingState extends State<Loading> {
  _LoadingState(this.category);
  final category;
  void get_Result() async {
    GetCategoryProd gcp = GetCategoryProd(category: category);
    await gcp.getRecommendation();
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: CategoryItemList(
              ret: gcp.ret['Output'],
              title_: category,
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Result();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: SpinKitSpinningLines(
          color: Colors.black,
          size: 80.0,
        ),
      ),
    );
  }
}
