import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/models/categoryModel.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  

  

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: cardData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            return Card(
        
              color: Color(cardData[index].catColor),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(cardData[index].catImages,height: 150, width:150, ),
                    ),
                    Text(cardData[index].catName, style: TextStyle(fontSize: 18),)
                  ],
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}