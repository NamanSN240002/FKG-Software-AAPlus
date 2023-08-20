import 'package:flutter/material.dart';
import 'package:recommender_app/home_page.dart';
import 'package:recommender_app/chatbot.dart';
import 'package:recommender_app/profile.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.ret, required this.user})
      : super(key: key);
  final ret;
  final user;
  @override
  State<TabPage> createState() => _TabPageState(ret, user);
}

class _TabPageState extends State<TabPage> {
  int selectedTab = 0;
  _TabPageState(this.ret, this.user);
  final ret;
  final user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: <Widget>[
          HomePage(ret: ret, user: user),
          Chatbot(),
          ProfilePage(user: user),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.grey.shade700,
        backgroundColor: Color(0xff23272C),
        selectedIndex: selectedTab,
        onDestinationSelected: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: '',
            selectedIcon: Icon(Icons.home_filled, color: Colors.white),
          ),
          NavigationDestination(
            icon: Icon(Icons.chat, color: Colors.white),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined, color: Colors.white),
            label: '',
          ),
        ],
      ),
    );
  }
}
