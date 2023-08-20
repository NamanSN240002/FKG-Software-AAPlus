import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/home_page.dart';
import 'package:recommender_app/utilities/apiservices.dart';
import 'package:recommender_app/tab_page.dart';

class Loading extends StatefulWidget {
  const Loading({super.key, required this.user});
  final user;
  @override
  State<Loading> createState() => _LoadingState(user);
}

class _LoadingState extends State<Loading> {
  _LoadingState(this.user);
  final user;
  void get_Result() async {
    GetTopRecommendations gtr = GetTopRecommendations(userSsn: user['ssn']);
    await gtr.getRecommendation();
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: TabPage(ret: gtr.ret['data'], user: user)));
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
