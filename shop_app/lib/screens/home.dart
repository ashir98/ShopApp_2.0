import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/constants/colors.dart';
import 'package:shop_app/widgets/appBar_icon.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shop_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List images = ["assets/images/1.jpg","assets/images/2.jpg","assets/images/3.jpg",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightScaffoldColor,
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        leading: AppBarIconButton(
          icon: IconlyBold.category,
        ),
        actions: [
          AppBarIconButton(icon: IconlyBold.user3)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                  contentPadding: EdgeInsets.all(10),
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
                    borderSide: BorderSide(color: Colors.black12)
                  )
                ),
                
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
                    Text("Latest products",style: TextStyle(fontSize: 22),),
                    IconButton(
                      onPressed: () {
                        
                      },
              
                      icon: Icon(IconlyBold.arrowRight2, color: lightIconsColor,size: 25,),
                    )
              
                  ],
                ),
              ),
              
              
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65),
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              )
              
              
              
              
              
              
              
              
              
              
              
              
              
              
            ],
          ),
        ),
      ),



    );
  }
}