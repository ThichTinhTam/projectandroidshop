class NotificationModel {
  final String title;
  final String description;
  final String imageUrl;
  final bool isread;

  NotificationModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.isread,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isread': isread,
    };
  }
  factory NotificationModel.fromMap(Map<String, dynamic> json){
    return NotificationModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isread: json['isread'],
    );
  }
}
