// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_app/constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, 
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productCategory,
    required this.productDesc,
    required this.productRating,
    required this.productCount
  });
  String productImage;
  String productName;
  String productPrice;
  String productCategory;
  String productDesc;
  String productRating;
  String productCount;

  List images = ["assets/images/1.jpg","assets/images/2.jpg","assets/images/3.jpg",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),


      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///category product and price of the product
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productCategory.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Expanded(child: Text(productName,style: const TextStyle(fontSize: 18),)),
      
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(IconlyBold.star, color: Colors.amber,),
                        Text(productRating, style: TextStyle(fontSize: 16),),
                        Text("($productCount)", style: TextStyle(color: Colors.grey, fontSize: 15),)

                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 5,),


            ///carousel slider 
            SizedBox(
            
              width: double.infinity,
              height: 200,
              child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Image.network(productImage,),
                  ),
            ),

            SizedBox(height: 5,),


            const Text("Description",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Expanded(
              child: Text(productDesc,
              style: const TextStyle(),
              textAlign: TextAlign.justify,
              
              
              ),
            ),

            Expanded(child: SizedBox()),

            Container(
              padding: EdgeInsets.all(15),
              height: 70,
              decoration: BoxDecoration(
                color: lightIconsColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("\$$productPrice", style: TextStyle(color: Colors.white, fontSize: 25),),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Text("Add to cart")
                      ],
                    ),
                    onPressed: () {
                      
                    },
                  )

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}