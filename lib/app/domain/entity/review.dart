import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int id;
  final int tourId;
  final AuthorEntity author;
  final String text;
  final String createdAt;
  final String updatedAt;

  const ReviewEntity({
    required this.id,
    required this.tourId,
    required this.author,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        tourId,
        author,
        text,
        createdAt,
        updatedAt,
      ];
}

class AuthorEntity extends Equatable {
  final int id;
  final String email;
  final String username;
  final String photo;

  const AuthorEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.photo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        username,
        photo,
      ];
}
