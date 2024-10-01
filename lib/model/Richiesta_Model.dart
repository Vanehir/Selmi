import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
class Cioccolato {
  final int id;
  final String title;
  final String nome;
  final String description;

  Cioccolato({
    required this.id,required this.title, required this.nome, required this.description});
  factory Cioccolato.fromJson(Map<String, dynamic>Json){
    return Cioccolato(id: Json['id'], title: Json['tite'], nome: Json['nome'], description: Json['description'],);
  }
}
*/


Future<List<dynamic>> fetchTemperaggioData() async {
  final response = await http.get(
      Uri.parse('https://66f4790377b5e88970999b7c.mockapi.io/selmi/temperaggio/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> fetchDocumentiData() async {
  final response = await http.get(
      Uri.parse('https://66f4790377b5e88970999b7c.mockapi.io/selmi/documenti/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
