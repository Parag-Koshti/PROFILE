import 'dart:convert';
import 'package:news/model/articles.dart';
import 'package:http/http.dart';

class Api{
  final endpoint = "https://reqres.in/api/users?page=1";
  Future<List<articles>>getData() async{
    Response response= await get(Uri.parse(endpoint));
    if(response.statusCode==200){
      Map<String,dynamic> json =jsonDecode(response.body);
      List<dynamic> body = json["data"];
      List<articles> data = body.map((dynamic item)=>articles.fromJson(item)).toList();
      return data;
    }
    else{
      throw """
      <-- No Data Found -->""";
    }
  }
}