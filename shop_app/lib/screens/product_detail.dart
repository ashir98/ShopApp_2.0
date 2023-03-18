import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  List images = ["assets/images/1.jpg","assets/images/2.jpg","assets/images/3.jpg",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),


      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///category product and price of the product
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product name",style: TextStyle(fontSize: 25),),
      
                    Text("\$200.00",style: TextStyle(fontSize: 20))
                  ],
                )
              ],
            ),


            ///carousel slider 
            SizedBox(
            
              width: double.infinity,
              height: 200,
              child: Swiper(
                
                physics: BouncingScrollPhysics(),
                autoplay: true,
                autoplayDisableOnInteraction: true,
                itemCount: images.length,
                itemBuilder: (context, index) {
              
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Image.asset(images[index], fit: BoxFit.fill,),
                  );
                  
                },
            
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: lightIconsColor
                  )
                ),
            

              ),
            ),


            Text("Description",style: TextStyle(fontSize: 25)),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(),
            textAlign: TextAlign.justify,
            
            
            )


          ],
        ),
      ),
    );
  }
}