class PostModel {
  String id;
  String profileImageUrl;
  String comment;
  String foodPictureUrl;
  String timestamp;

  PostModel({
    required this.id,
    required this.profileImageUrl,
    required this.comment,
    required this.foodPictureUrl,
    required this.timestamp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      comment: json['comment'] ?? '',
      foodPictureUrl: json['foodPictureUrl'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}
