import 'package:flutter/material.dart';
import 'package:news/model/articles.dart';

class DataListView extends StatelessWidget {
  final List<articles> Data;

  const DataListView({Key? key, required this.Data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: Data.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(data: Data[index]),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.black,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70.0)
              ),
              elevation: 20,
              color: Colors.pink,
              child: Row(
                children: [
                  Image.network(Data[index].avatar),
                  Text(
                    Data[index].first_name,
                    style: const TextStyle(fontSize: 45,color: Colors.black38,fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        title: Text("INFORMATION",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 35),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ID:${data.id}",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w900,fontSize: 25),),
              SizedBox(height: 16),
              Image.network("${data.avatar}"),

              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("NAME: \n${data.first_name} ${data.last_name}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              Text("EMAIL:\n${data.email}",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900)),

            ],
          ),
        ),
      ),
    );
  }
}