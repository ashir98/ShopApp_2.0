import 'dart:math';

import 'package:flutter/material.dart';
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
          future: apiService.apiService(),
          builder: (context, snapshot) {
            
            if(!snapshot.hasData){

              return Center(
                child: CircleAvatar(),
              );
            }else{
              return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.65), 
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductCard(
              cardColor: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade50,
              productName: snapshot.data![index].title.toString(),
              productimage: snapshot.data![index].toString(),
              productPrice: snapshot.data![index].toString(),

              
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