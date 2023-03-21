// ignore_for_file: file_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/constants/colors.dart';

class AppBarIconButton extends StatelessWidget {
  IconData icon;
  var onTap;
  AppBarIconButton({required this.onTap, required this.icon ,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: lightIconsColor,),
        ),

      ),
    );
  }
}