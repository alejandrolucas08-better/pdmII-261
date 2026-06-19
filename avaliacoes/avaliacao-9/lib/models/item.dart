class Item {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Item({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
