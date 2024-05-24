class CommentList {
  int postId;
  int id;
  String body;
  String name;
  String email;

  CommentList({
    required this.postId,
    required this.id,
    required this.body,
    required this.name,
    required this.email,
  });

  factory CommentList.fromJson(Map<String, dynamic> data) {
    return CommentList(
      postId: data['postId'],
      id: data['id'],
      name: data['name'],
      email: data['email'],
      body: data['body'],
    );
  }
}
