import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/products_model.dart';

class ApiService{

  List<ProductsModel> productList = [];

  Future<List<ProductsModel>> apiService()async{

    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode ==200){

      for(Map i in data){
        productList.add(ProductsModel.fromJson(i));
      }
      return productList;

    }else{
      return productList;
    }


  }
}