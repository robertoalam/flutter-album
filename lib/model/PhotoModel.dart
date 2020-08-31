class PhotoModel {
  int id;
  int AlbumId;
  String url;
  String thumbnailUrl;
  PhotoModel(int id, int AlbumId, String url, thumbnailUrl) {
    this.id = id;
    this.AlbumId = AlbumId;
    this.url = url;
    this.thumbnailUrl = thumbnailUrl;
  }

  PhotoModel.fromJson(Map json)
      : id = json['id'],
        AlbumId = json['AlbumId'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  Map toJson() {
    return {'id': id, 'AlbumId': AlbumId, 'url': url , 'thumbnailUrl':thumbnailUrl};
  }
}