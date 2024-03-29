class NatificationModel{
  final int id;
  final String name;

  NatificationModel({required this.name,required this.id});
}

class PushNotificationModel {
  final int id;
  final String name;

  PushNotificationModel({
    required this.id,
    required this.name,
  });

}

class News {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'date': date.toIso8601String(),
    };
  }
}

