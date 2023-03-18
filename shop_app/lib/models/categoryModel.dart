import 'package:flutter/material.dart';

class CategoryModel{

  int catColor;
  String catImages;
  String catName;


  CategoryModel({

    required this.catColor,
    required this.catImages,
    required this.catName
  });

}


final List<CategoryModel> cardData = [


  CategoryModel( catName: "Clothes",catColor: 0xff99eeff, catImages: "assets/images/card_images/cloth.png"),
  CategoryModel( catName: "Electronics",catColor: 0xff919191, catImages: "assets/images/card_images/electronic.png"),
  CategoryModel( catName: "Cosmetics" ,catColor: 0xfffadbff, catImages: "assets/images/card_images/cosmetic.png",)


];