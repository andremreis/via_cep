import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viacep/domain/endereco.dart';

Future<Endereco> BuscarDados(String url) async{
  final response = await http.get(url);

  if(response.statusCode == 200){
    return Endereco.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Aguardando...");
  }

}