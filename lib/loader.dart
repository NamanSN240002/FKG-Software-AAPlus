import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/home_page.dart';
import 'package:recommender_app/utilities/apiservices.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void get_Result() async {
    GetTopRecommendations gtr = GetTopRecommendations(userSsn: '843-18-8541');
    await gtr.getRecommendation();
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(ret: gtr.ret['data'])));
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
