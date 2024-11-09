import 'dart:convert';

import 'package:apituto/model/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PraciceGetApis extends StatefulWidget {
  const PraciceGetApis({super.key});

  @override
  State<PraciceGetApis> createState() => _PraciceGetApisState();
}

class _PraciceGetApisState extends State<PraciceGetApis> {
  List <photosmodel> PhotosList=[];
  Future<List<photosmodel>> getPhotosApi  ()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
if(response.statusCode==200){
  for(var i in data){
   PhotosList.add(photosmodel.fromJson(i));
  }
  return PhotosList;
}else{
  return PhotosList;
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotosApi(),
               builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text("Loadinggg");
                }
                else{
                  return ListView.builder(
                    itemCount: PhotosList.length,
                    itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(PhotosList[index].url.toString()),
                      ),
                      title: Text("Notes Id "+PhotosList[index].id.toString()),
                      subtitle: Text(PhotosList[index].title.toString()),
                      
                    );
                    
                  });
                }
               }),
          ),
        ],
      ),
    );
  }
}