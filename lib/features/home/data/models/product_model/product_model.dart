import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? title;
  final String? difficulty;
  final String? image;

  const ProductModel({this.id, this.title, this.difficulty, this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        difficulty: json['difficulty'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'difficulty': difficulty,
        'image': image,
      };

  @override
  List<Object?> get props => [id, title, difficulty, image];
}
