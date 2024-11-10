import 'dart:convert';

import 'package:apituto/model/practice_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SelfMade extends StatefulWidget {
  const SelfMade({super.key});

  @override
  State<SelfMade> createState() => _SelfMadeState();
}

class _SelfMadeState extends State<SelfMade> {
  List<practicemodel> PracticeLits=[];
  Future<List<practicemodel>> GetPracticeApi()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(var i in data){
        PracticeLits.add(practicemodel.fromJson(i));
        
      }
      return PracticeLits;
    }else{
      return PracticeLits;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("practice api's"),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(future: GetPracticeApi(), builder: (context,snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              return ListView.builder(
                itemCount: PracticeLits.length,
                itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Id "+PracticeLits[index].id.toString()),
                    
                    Text("Name "+PracticeLits[index].name.toString()),
                    Text("Email: "+PracticeLits[index].email.toString()),
                    Text("body   "+PracticeLits[index].body.toString())
                      ],
                    ),
                  ),
                );
              });
            }
          }))
        ],
      ),
    );
  }
}