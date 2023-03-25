import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_app/constants/colors.dart';
import 'package:shop_app/screens/product_detail.dart';
import 'package:shop_app/services/api_service.dart';
import 'package:shop_app/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  ApiService apiService = ApiService();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("All prodcuts"),
        centerTitle: true,
      ),



      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: apiService.getProduct(),
          builder: (context, snapshot) {
            
            if(!snapshot.hasData){

              return Center(
                child: CircularProgressIndicator(
                  color: lightIconsColor,
                ),
              );
            }else{
              return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.65), 
          itemCount: apiService.productList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductCard(
              cardColor: lightCardColor,
              productName: snapshot.data![index].title.toString(),
              productimage: snapshot.data![index].image.toString(),
              productPrice: snapshot.data![index].price.toString(),
              onTap: (){
                Navigator.push(
                  context,
                  PageTransition(
                    child: ProductDetailScreen(
                      productName: snapshot.data![index].title.toString(),
                      productImage: snapshot.data![index].image.toString(),
                      productPrice: snapshot.data![index].price.toString(),
                      productCategory: snapshot.data![index].category.toString(),
                      productDesc: snapshot.data![index].description.toString(),
                      productRating: snapshot.data![index].rating!.rate.toString(),
                      productCount: snapshot.data![index].rating!.count.toString(),
                    ),
                    type: PageTransitionType.fade
                  )
                );
              },

              
            );
          },
        );
            }
          },
        )
      ),


    );
  }
}