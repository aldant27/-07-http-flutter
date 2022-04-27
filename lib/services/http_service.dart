// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_/models/movie.dart';

class HttpService {
  final String apiKey = 'f9b34dfff62d95f773cde3922db4b0d6';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';
  


  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Salah");
      return null;
    }
  }
}
