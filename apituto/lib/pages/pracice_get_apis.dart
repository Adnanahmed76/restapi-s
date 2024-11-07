import 'dart:convert';

import 'package:apituto/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PracticeGetAps extends StatefulWidget {
  const PracticeGetAps({super.key});

  @override
  State<PracticeGetAps> createState() => _PracticeGetApsState();
}

class _PracticeGetApsState extends State<PracticeGetAps> {
List <postmodel> PostListt=[];
Future<List<postmodel>> GetPostApi ()async{
  final responce=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data=jsonDecode(responce.body.toString());
  if(responce.statusCode==200){
for(var i in data)
PostListt.add(postmodel.fromJson(i));
return PostListt;
  }else{
return PostListt;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Expanded(
  child: FutureBuilder(future: GetPostApi(), builder: (context,snapshot){
   if(!snapshot.hasData){
  return Text("Loading");
   }else{
    return ListView.builder(
      itemCount: PostListt.length,
      itemBuilder: (context,index){
  return Text(index.toString());
    });
   }
  
  }),
),

    );
  }
}