import 'dart:convert';

import 'package:apituto/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PraciceGetApis extends StatefulWidget {
  const PraciceGetApis({super.key});

  @override
  State<PraciceGetApis> createState() => _PraciceGetApisState();
}

class _PraciceGetApisState extends State<PraciceGetApis> {
List<postmodel> ListPosts=[];

Future<List<postmodel>> getPostApii()async{
  final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data=jsonDecode(response.body.toString());
  if(response.statusCode==200){
    for(var i in data)
    ListPosts.add(postmodel.fromJson(i));
    return ListPosts;
  }
  else{
    return ListPosts;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        
        future: getPostApii(),
        
         builder: (context,snapshot){
          if(!snapshot.hasData){
            return Text("Loading");
          }
          else{
            return ListView.builder(itemBuilder: (context,index){
              return Text(index.toString());
            });
          }
         })
    );
  }
}