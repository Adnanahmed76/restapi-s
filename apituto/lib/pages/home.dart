import 'dart:convert';

import 'package:apituto/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<postmodel> postList=[];
  Future<List<postmodel>> getPostApi() async{
final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
var data=jsonDecode(response.body.toString());

if(response.statusCode==200){
  postList.clear();
  for(var i in data){
postList.add(postmodel.fromJson(i));
  }
  return postList;
}else{
return postList;
}
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api's"),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              
              future: getPostApi(),
              
               builder: (context,snapshot){
            if(!snapshot.hasData){

            return Text("Loading");
            }else{
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User id "+ postList[index].id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
                   
                Text("Title"  ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue,),),
                    Text(postList[index].title.toString()),
                    SizedBox(height: 10,),
                    Text("Description" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.purple),),
                    Text(postList[index].body.toString())
                  ],
                ),
              ),
            );
            });
            }
               }),
          )
        ],
      ),
    );
  }
}