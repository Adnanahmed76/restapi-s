import 'dart:convert';

import 'package:apituto/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ComplexJsoPrac extends StatefulWidget {
  const ComplexJsoPrac({super.key});

  @override
  State<ComplexJsoPrac> createState() => _ComplexJsoPracState();
}

class _ComplexJsoPracState extends State<ComplexJsoPrac> {
  List<usermodel> UserList=[];
  Future<List<usermodel>> GetUserApi()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(var i in data){
        UserList.add(usermodel.fromJson(i));

      }
 return UserList;
    }
   else{
    return UserList;
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex json apis"),

      ),
      body: FutureBuilder(
        future: GetUserApi(),
         builder: (context,snapshot){
          if(!snapshot.hasData){
            return Text("Loading");
          }
          else{
            return ListView.builder(
              itemCount: UserList.length,
              itemBuilder: (context,index){
              return Text(UserList[index].id.toString());
            });
          }
         }),
    );
  }
}