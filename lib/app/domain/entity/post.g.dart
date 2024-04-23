// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      tour: json['tour'] as int,
      phoneNumber: json['phone_number'] as String,
      commentary: json['commentary'] as String,
      numberOfPeople: json['number_of_people'] as int,
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'tour': instance.tour,
      'phone_number': instance.phoneNumber,
      'commentary': instance.commentary,
      'number_of_people': instance.numberOfPeople,
    };
