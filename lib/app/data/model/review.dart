import 'package:neo_tour/app/domain/entity/review.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel(
      {required super.id,
      required super.tourId,
      required super.author,
      required super.text,
      required super.createdAt,
      required super.updatedAt});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      tourId: json['tour'],
      author: AuthorModel.fromJson(json['author']),
      text: json['text'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class AuthorModel extends AuthorEntity {
  const AuthorModel(
      {required super.id,
      required super.email,
      required super.username,
      required super.photo});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      photo: json['photo'],
    );
  }
}
