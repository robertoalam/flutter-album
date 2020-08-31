class AlbumModel {
  int id;
  int userId;
  String title;

  AlbumModel(int id, int userId, String title) {
    this.id = id;
    this.userId = userId;
    this.title = title;
  }

  AlbumModel.fromJson(Map json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'];

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title};
  }
}