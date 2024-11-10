import 'dart:convert';

import 'package:apituto/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductsApiss extends StatefulWidget {
  const ProductsApiss({super.key});

  @override
  State<ProductsApiss> createState() => _ProductsApissState();
}

class _ProductsApissState extends State<ProductsApiss> {
  List<Listmodeldata> ProductsList=[];
  Future<List<Listmodeldata>> GetProducstapi()async{
    final response=await http.get(Uri.parse("https://webhook.site/dce4c646-a44b-4db6-ae7d-681b1a23b67b"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(data);
      for(var i in data){
ProductsList.add(Listmodeldata.fromJson(i));
      }
      return ProductsList;
    }else{
      return ProductsList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("very complex json "),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
            
            future: GetProducstapi(),
             builder: (context,snapshot){
              if(snapshot.hasData){
return Text("Loading");
              }else{
               return ListView.builder(
          itemCount: ProductsList.length,
          itemBuilder: (context,index){
          return Column(
            children: [
              Text(index.toString())
            ],
          );
         });
              }
         
             }))
        ],
      ),
    );
  }
}