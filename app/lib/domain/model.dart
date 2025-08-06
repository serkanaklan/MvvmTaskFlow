class Model1 {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  Model1({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  factory Model1.fromJson(Map<String, dynamic> json) {
    return Model1(
      postId: json['postId'] is int ? json['postId'] : 0,
      id: json['id'] is int ? json['id'] as int : 0,
      name: json['name'] as String? ?? "No Found Name",
      email: json['email'] as String? ?? "No Found Email",
      body: json['body'] as String? ?? "No Found Body",
    );
  }
}
