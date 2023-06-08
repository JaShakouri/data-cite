import 'dart:convert';

class ClientsTotal {
  List<ClientsTotals>? _clients;

  List<ClientsTotals> get clients => _clients ?? [];

  ClientsTotal.fromJson(dynamic json) {
    if (json != null) {
      _clients = [];
      json.forEach((v) {
        _clients?.add(ClientsTotals.fromJson(v));
      });
    }
  }
}

ClientsTotals responseClientsTotalsModelFromJson(String str) =>
    ClientsTotals.fromJson(json.decode(str));

String responseClientsTotalsModelToJson(ClientsTotals data) =>
    json.encode(data.toJson());

class ClientsTotals {
  ClientsTotals({
    String? id,
    String? title,
    num? count,
  }) {
    _id = id;
    _title = title;
    _count = count;
  }

  ClientsTotals.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _count = json['count'];
  }

  String? _id;
  String? _title;
  num? _count;

  ClientsTotals copyWith({
    String? id,
    String? title,
    num? count,
  }) =>
      ClientsTotals(
        id: id ?? _id,
        title: title ?? _title,
        count: count ?? _count,
      );

  String? get id => _id;

  String? get title => _title;

  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['count'] = _count;
    return map;
  }
}
