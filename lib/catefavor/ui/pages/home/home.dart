import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/ui/pages/home/home_drawer.dart';
import 'home_app_bar.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: HomeContent(),
      drawer: HomeDrawer(),
    );
  }
}
