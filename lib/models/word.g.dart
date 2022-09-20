// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      json['id'] as String,
      json['tag'] as String,
      json['category'] as String,
      DateTime.parse(json['last_update'] as String),
      DateTime.parse(json['create_date'] as String),
      json['word'] as String,
      json['publish'] as bool,
      json['img_cat'] as String,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'category': instance.category,
      'last_update': instance.lastUpdate.toIso8601String(),
      'create_date': instance.createDate.toIso8601String(),
      'word': instance.word,
      'publish': instance.publish,
      'img_cat': instance.imageCategory,
    };
