import 'package:json_annotation/json_annotation.dart';

part 'create_and_update_word_request.g.dart';

@JsonSerializable()
class CreateAndUpdateWordRequest {
  final int id;
  final String word;
  final String tag;
  final String category;
  final bool publish;
  @JsonKey(name: "img_cat")
  final String imageCategory;
  CreateAndUpdateWordRequest(this.id, this.word, this.tag, this.category,
      this.publish, this.imageCategory);
  factory CreateAndUpdateWordRequest.fromJson(json) =>
      _$CreateAndUpdateWordRequestFromJson(Map<String, dynamic>.from(json));
  Map<String, dynamic> toJson() => _$CreateAndUpdateWordRequestToJson(this);
}
