import 'package:http/http.dart' as http;
import 'dart:convert';

final dominiourl = 'http://192.168.1.2/lugaresasombrosos/wp-json/wp/v2/posts?_embed';

Future<List> lugares() async{
  final response = await http.get(dominiourl, headers: {'Accept':'application/json'});
  var convertiarjson = jsonDecode(response.body);
  print(convertiarjson);
  return convertiarjson;
}