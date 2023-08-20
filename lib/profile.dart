import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/successful_main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});
  final user;
  @override
  State<ProfilePage> createState() => _ProfilePageState(user);
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState(this.user);
  final user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        backgroundColor: Color(0xff23272C),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.account_circle,
              size: 120,
            ),
            Text(
              'SSN:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["ssn"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'NAME:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'SEX:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["sex"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'JOB:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["job"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'COMPANY:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["company"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'DATE OF BIRTH:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              user["Date of Birth"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade900, // Background color
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: Login(), type: PageTransitionType.fade));
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
