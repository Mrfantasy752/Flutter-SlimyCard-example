import 'package:flutter/material.dart';
import 'package:slimy_card_example/myslimycard.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "FooDMate",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        elevation: 10,
        // actionsIconTheme: const IconThemeData(color: Colors.deepPurple),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 27.0),
          ),
        ),
        // actions: const [
        //   Icon(Icons.home),
        // ],
      ),
      body: const MyslimyCard(),
    );
  }
}
