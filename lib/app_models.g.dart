// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieObject _$MovieListFromJson(Map<String, dynamic> json) {
  return MovieObject(
      score: (json['score'] as num)?.toDouble(),
      show: json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MovieListToJson(MovieObject instance) =>
    <String, dynamic>{'score': instance.score, 'show': instance.show};

Show _$ShowFromJson(Map<String, dynamic> json) {
  return Show(
      id: json['id'] as int,
      name: json['name'] as String,
      showImage: json['image'] == null
          ? null
          : ShowImage.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.showImage
    };

ShowImage _$ShowImageFromJson(Map<String, dynamic> json) {
  return ShowImage(
      original: json['original'] as String, medium: json['medium'] as String);
}

Map<String, dynamic> _$ShowImageToJson(ShowImage instance) =>
    <String, dynamic>{'original': instance.original, 'medium': instance.medium};
