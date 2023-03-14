import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/constants/colors.dart';

class AppBarIconButton extends StatelessWidget {
  IconData icon;
  AppBarIconButton({ required this.icon ,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),

        child: Padding(
          padding: EdgeInsets.all(12),
          child: Icon(icon, color: lightIconsColor,),
        ),

      ),
    );
  }
}