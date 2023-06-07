import 'dart:convert';

ResponseProviderModel responseProviderModelFromJson(String str) =>
    ResponseProviderModel.fromJson(json.decode(str));

class ResponseProviderModel {
  ResponseProviderModel({
    List<ProviderData>? data,
    MetaPage? meta,
  }) {
    _data = data;
    _meta = meta;
  }

  ResponseProviderModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProviderData.fromJson(v));
      });
    }

    if (json['meta'] != null) {
      _meta = metaPageFromJson(jsonEncode(json["meta"]));
    }
  }

  List<ProviderData>? _data;
  MetaPage? _meta;

  ResponseProviderModel copyWith({
    List<ProviderData>? data,
    MetaPage? meta,
  }) =>
      ResponseProviderModel(
        data: data ?? _data,
        meta: meta ?? _meta,
      );

  List<ProviderData> get providers => _data ?? [];

  MetaPage? get page => _meta;
}

ProviderData dataFromJson(String str) =>
    ProviderData.fromJson(json.decode(str));

String dataToJson(ProviderData data) => json.encode(data.toJson());

class ProviderData {
  ProviderData({
    String? id,
    String? type,
    Attributes? attributes,
  }) {
    _id = id;
    _type = type;
    _attributes = attributes;
  }

  ProviderData.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  String? _id;
  String? _type;
  Attributes? _attributes;

  ProviderData copyWith({
    String? id,
    String? type,
    Attributes? attributes,
  }) =>
      ProviderData(
        id: id ?? _id,
        type: type ?? _type,
        attributes: attributes ?? _attributes,
      );

  String? get id => _id;

  String? get type => _type;

  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }
}

Attributes attributesFromJson(String str) =>
    Attributes.fromJson(json.decode(str));

String attributesToJson(Attributes data) => json.encode(data.toJson());

class Attributes {
  Attributes({
    String? name,
    String? displayName,
    String? symbol,
    String? memberType,
    String? nonProfitStatus,
    String? created,
    String? updated,
    num? doiEstimate,
  }) {
    _name = name;
    _displayName = displayName;
    _symbol = symbol;
    _memberType = memberType;
    _nonProfitStatus = nonProfitStatus;
    _created = created;
    _updated = updated;
    _doiEstimate = doiEstimate;
  }

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _displayName = json['displayName'];
    _symbol = json['symbol'];
    _memberType = json['memberType'];
    _nonProfitStatus = json['nonProfitStatus'];
    _created = json['created'];
    _updated = json['updated'];
    _doiEstimate = json['doiEstimate'];
  }

  String? _name;
  String? _displayName;
  String? _symbol;
  String? _memberType;
  String? _nonProfitStatus;
  String? _created;
  String? _updated;
  num? _doiEstimate;

  Attributes copyWith({
    String? name,
    String? displayName,
    String? symbol,
    String? memberType,
    String? nonProfitStatus,
    String? created,
    String? updated,
    num? doiEstimate,
  }) =>
      Attributes(
        name: name ?? _name,
        displayName: displayName ?? _displayName,
        symbol: symbol ?? _symbol,
        memberType: memberType ?? _memberType,
        nonProfitStatus: nonProfitStatus ?? _nonProfitStatus,
        created: created ?? _created,
        updated: updated ?? _updated,
        doiEstimate: doiEstimate ?? _doiEstimate,
      );

  String? get name => _name;

  String? get displayName => _displayName;

  String? get symbol => _symbol;

  String? get memberType => _memberType;

  String? get nonProfitStatus => _nonProfitStatus;

  String? get created => _created;

  String? get updated => _updated;

  num? get doiEstimate => _doiEstimate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['displayName'] = _displayName;
    map['symbol'] = _symbol;
    map['memberType'] = _memberType;
    map['nonProfitStatus'] = _nonProfitStatus;
    map['created'] = _created;
    map['updated'] = _updated;
    map['doiEstimate'] = _doiEstimate;
    return map;
  }
}

MetaPage metaPageFromJson(String str) => MetaPage.fromJson(json.decode(str));

String metaPageToJson(MetaPage data) => json.encode(data.toJson());

class MetaPage {
  MetaPage({
    num? total,
    num? totalPages,
    num? page,
  }) {
    _total = total;
    _totalPages = totalPages;
    _page = page;
  }

  MetaPage.fromJson(dynamic json) {
    _total = json['total'];
    _totalPages = json['totalPages'];
    _page = json['page'];
  }

  num? _total;
  num? _totalPages;
  num? _page;

  MetaPage copyWith({
    num? total,
    num? totalPages,
    num? page,
  }) =>
      MetaPage(
        total: total ?? _total,
        totalPages: totalPages ?? _totalPages,
        page: page ?? _page,
      );

  num? get total => _total;

  num? get totalPages => _totalPages;

  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['totalPages'] = _totalPages;
    map['page'] = _page;
    return map;
  }
}
