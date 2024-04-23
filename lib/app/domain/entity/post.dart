import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class PostRequest {
  @JsonKey(name: 'tour')
  int tour;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'commentary')
  String commentary;

  @JsonKey(name: 'number_of_people')
  int numberOfPeople;

  PostRequest({
    required this.tour,
    required this.phoneNumber,
    required this.commentary,
    required this.numberOfPeople,
  });

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
