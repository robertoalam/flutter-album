class UserModel {
  int id;
  String name;
  String email;

  UserModel(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  UserModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}