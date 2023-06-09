import 'package:flutter/material.dart';
import 'package:shop_app/screens/home.dart';

void main(){

  runApp(const ShopApp());


}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lato",
        useMaterial3: true
      ),
      home: HomePage(),
    );
  }
}