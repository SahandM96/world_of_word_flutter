import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  final String id;
  final String tag;
  final String category;
  @JsonKey(name: "last_update")
  final DateTime lastUpdate;
  @JsonKey(name: "create_date")
  final DateTime createDate;
  final String word;
  final bool publish;
  @JsonKey(name: "img_cat")
  final String imageCategory;

  Word(this.id, this.tag, this.category, this.lastUpdate, this.createDate,
      this.word, this.publish, this.imageCategory);

  factory Word.fromJson(json) =>
      _$WordFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
