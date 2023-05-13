import 'package:flutter/material.dart';
import 'package:news/model/articles.dart';
import 'package:news/services/api.dart';
import 'Data.dart';


void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title:  const Text("PROFILES",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 30),),
      backgroundColor: Colors.pinkAccent,
        elevation: 25,

      ),
      body: FutureBuilder(
        future:  Api().getData(),
        builder: (BuildContext context, AsyncSnapshot<List<articles>> snapshot){
          if(snapshot.hasData){
            return DataListView(Data: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator(
            color: Colors.red,
          ));
        },
      ),
    );
  }
}