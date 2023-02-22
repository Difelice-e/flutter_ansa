import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_ansa/models/article.dart';

Future<List<Article>> topHeadlines() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=ansa&apiKey=cb56774b9e5e4fdb833b280c356d2824"));
  List articles = json.decode(response.body)['articles'];
  return articles.map((data) => Article.fromData(data)).toList();
}

Future<List<Article>> everything() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/everything?sources=ansa&apiKey=cb56774b9e5e4fdb833b280c356d2824"));
  List articles = json.decode(response.body)['articles'];
  return articles.map((data) => Article.fromData(data)).toList();
}
