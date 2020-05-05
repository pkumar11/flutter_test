import 'package:flutter/material.dart';

class Movie {
  String title;
  String description;
  double rating;
  int runtime;

  Movie({title, description, rating, runtime}){
    this.title = title;
    this.description = description;
    this.rating = rating;
    this.runtime = runtime;
  }
}



Movie movieObj = new Movie(
  title: 'sadasd',
  description: 'asdasd',
  rating: 1211.4,
  runtime: 120
);



