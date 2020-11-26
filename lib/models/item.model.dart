import 'package:floor/floor.dart';

@entity
class Produto {
  @PrimaryKey(autoGenerate: true)
  int id;
  String meaning;

  Produto({this.id, this.meaning});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meaning'] = this.meaning;
    return data;
  }
}