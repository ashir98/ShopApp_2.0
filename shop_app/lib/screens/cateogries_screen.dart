import 'package:flutter/material.dart';
import 'package:shop_app/models/categoryModel.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  

  

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: cardData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return Card(
          
                color: Color(cardData[index].catColor),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(cardData[index].catImages,height: 100, width:100, ),
                      ),
                      Text(cardData[index].catName, style: const TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}