// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_and_update_word_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAndUpdateWordRequest _$CreateAndUpdateWordRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAndUpdateWordRequest(
      json['id'] as int,
      json['word'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['publish'] as bool,
      json['img_cat'] as String,
    );

Map<String, dynamic> _$CreateAndUpdateWordRequestToJson(
        CreateAndUpdateWordRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'tag': instance.tag,
      'category': instance.category,
      'publish': instance.publish,
      'img_cat': instance.imageCategory,
    };
