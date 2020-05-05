import 'package:json_annotation/json_annotation.dart';

part 'app_models.g.dart';

@JsonSerializable()
class MovieObject{
  double score;
  Show show;

  MovieObject({this.score, this.show});

  factory MovieObject.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
}

@JsonSerializable()
class Show {
  int id;
  String name;
  @JsonKey(name: "image")
  ShowImage showImage;

  Show({this.id, this.name, this.showImage});

  factory Show.fromJson(Map<String, dynamic> json) =>
      _$ShowFromJson(json);
}

@JsonSerializable()
class ShowImage {

  String original;
  String medium;

  ShowImage({this.original, this.medium});

  factory ShowImage.fromJson(Map<String, dynamic> json) =>
      _$ShowImageFromJson(json);
}

class MovieResponse{
  List<MovieObject> createMovieList({dynamic j_data, List<MovieObject> movieList}){
    for(var j in j_data){
      movieList.add(MovieObject.fromJson(j));
    }
    return movieList;
  }
}


