import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_app/constants/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: lightCardColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$200"),
                  Icon(IconlyBold.heart, color: lightIconsColor, size: 25,) 
              
                ],
              ),
            ),


            Expanded(
              flex: 4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/images/product.jpg"),
                  ),
                  SizedBox(height: 8,),
                  Text("Apple Iphone 14 Pro", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}