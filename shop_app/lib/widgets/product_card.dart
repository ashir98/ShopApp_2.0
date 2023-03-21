
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_app/constants/colors.dart';
import 'package:shop_app/screens/product_detail.dart';

class ProductCard extends StatelessWidget {

  Color cardColor;
  String productimage;
  String productName;
  String productPrice;
  ProductCard({required this.productName,required this.productimage ,required this.productPrice,required this.cardColor,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ProductDetailScreen(),
            type: PageTransitionType.fade

          )
        );
      },
      child: Card(
        elevation: 0,
        color: cardColor,
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
                    Text("\$ $productPrice"),
                    Icon(IconlyBold.heart, color: lightIconsColor, size: 25,) 
                
                  ],
                ),
              ),
    
    
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(productimage , width: 50, height: 50,) ,
                      ),
                    ),
                    const SizedBox(height: 8,),
                   Text(productName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, ) ,overflow: TextOverflow.ellipsis ,)
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}