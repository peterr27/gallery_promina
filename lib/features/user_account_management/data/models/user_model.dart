class AppUserModel {
  AppUserModel({this.name, this.id});
  int? id;
  String? name;
  String? token;
  AppUserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        token = json['token'],
        id = json['id'];

  Map<String, dynamic> toJson() => {'name': name, 'id': id, 'token': token};
}
