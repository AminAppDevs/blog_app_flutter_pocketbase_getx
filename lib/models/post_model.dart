class PostModel {
  final String id;
  final String created;
  final String image;
  final String title;
  final String content;

  PostModel(
    this.id,
    this.created,
    this.image,
    this.title,
    this.content,
  );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        json['id'],
        json['created'],
        json['image'],
        json['title'],
        json['content'],
      );
}
