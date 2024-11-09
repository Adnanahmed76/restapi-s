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
      body: Column(
        children: [
          Expanded(
            
            child: FutureBuilder(
              future: GetUserApi(),
               builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text("Loading");
                }
                else{
                  return ListView.builder(
                    itemCount: UserList.length,
                    itemBuilder: (context,index){
return Card(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
  ReusableRow(title: "Name", value: UserList[index].name.toString()),
        ReusableRow(title: "Username", value: UserList[index].username.toString()),
        ReusableRow(title: "Email", value: UserList[index].email.toString()),
        ReusableRow(
          title: "Address", 
          value: "${UserList[index].address!.street}, "
               
        ),
        
        ReusableRow(title: "Geo", value: UserList[index].address!.geo!.lat.toString())],
    ),
  ),
);
                  });
                }
               }))
        ],
      )
    );
  }
  
}
// ignore: must_be_immutable
class ReusableRow extends StatelessWidget {
  String title,value;

   ReusableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     
    children: [
      Text(title),
      Text(value)
      
    ],
    );
  }
}