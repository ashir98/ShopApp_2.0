// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/constants/colors.dart';
import 'package:shop_app/screens/cateogries_screen.dart';
import 'package:shop_app/screens/product_detail.dart';
import 'package:shop_app/screens/products_screen.dart';
import 'package:shop_app/services/api_service.dart';
import 'package:shop_app/widgets/appBar_icon.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List images = ["assets/images/1.jpg","assets/images/2.jpg","assets/images/3.jpg",];

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightScaffoldColor,
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
        leading: AppBarIconButton(
          icon: IconlyBold.category,
          onTap: (){
            Navigator.push(
              context,
              PageTransition(
                child: const CategoriesScreen(),
                type: PageTransitionType.fade
              )
            );
          },
        ),
        actions: [
          AppBarIconButton(
            icon: IconlyBold.user3,
            onTap: (){

            },
          )
        ],

        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              
              ///seachbar
              TextField(
                cursorHeight: 25,
                cursorColor: lightIconsColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(IconlyLight.search, color: lightIconsColor,),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: lightCardColor,
                  hintText: "Search products",
                  hintStyle: TextStyle(color: lightTextColor.withOpacity(0.7)),
                  border: InputBorder.none,
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: lightIconsColor,
                      width: 2,
                    )
                  ),
              
              
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12)
                  )
                ),
                
              ),
              
              ///carousel slider
              SizedBox(
              
                width: double.infinity,
                height: 200,
                child: Swiper(
                  
                  physics: const BouncingScrollPhysics(),
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
              
                  control: SwiperControl(
                    color: lightIconsColor
                  ),
                ),
              ),
              
              
              ///latest producst text and button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Latest products",style: TextStyle(fontSize: 22),),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                          child:  ProductsScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 300)
                        ));
                      },
              
                      icon: Icon(IconlyBold.arrowRight2, color: lightIconsColor,size: 25,),
                    )
              
                  ],
                ),
              ),



              FutureBuilder(
                future: apiService.getProduct(),

                builder: (context, snapshot) {

                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        color: lightIconsColor,
                      ),
                    );

                  }else{

                    return               GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65),
                itemCount: apiService.productList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
              
              

              
              
              
              
              
              
              
              
              
              
              
              
              
              
            ],
          ),
        ),
      ),



    );
  }
}