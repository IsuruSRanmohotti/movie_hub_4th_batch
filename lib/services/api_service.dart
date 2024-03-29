import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_hub/models/movie_model.dart';

class ApiService {
  final apiKey = 'api_key=206f4bdc58a80317e550efddb30793aa';
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';
  final nowPlaying = 'https://api.themoviedb.org/3/movie/now_playing?';
  final topRatedMovies = 'https://api.themoviedb.org/3/movie/top_rated?';
  final upcomingMovies = 'https://api.themoviedb.org/3/movie/upcoming?';
  final movieData = "https://api.themoviedb.org/3/movie/";
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$popularMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse('$nowPlaying$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse('$topRatedMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse('$upcomingMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return [];
    }
  }

  Future<MovieModel?> getMovieDetails(int id) async {
    final response = await http.get(Uri.parse('$movieData$id?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      MovieModel movie = MovieModel.fromJson(body);
      return movie;
    } else {
      Logger().e('Error - ${response.statusCode}');
      return null;
    }
  }
}
