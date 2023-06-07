import 'dart:convert';
/// data : [{"id":"gesis.csda","type":"clients","attributes":{"name":"Czech Social Science Data Archive","symbol":"GESIS.CSDA","year":2015,"alternateName":null,"description":"The Czech Social Science Data Archive (CSDA) of the Institute of Sociology of the Academy of Sciences of the Czech Republic accesses, processes, documents and stores data files from social science research projects and promotes their dissemination to make them widely available for secondary use in academic research and for educational purposes.","language":[],"clientType":"repository","domains":"*","re3data":"https://doi.org/10.17616/R35P6H","opendoar":null,"issn":{},"url":"https://archiv.soc.cas.cz/en/","created":"2015-04-08T13:50:52Z","updated":"2023-02-17T08:39:46Z","isActive":true},"relationships":{"provider":{"data":{"id":"csda","type":"providers"}},"consortium":{"data":{"id":"DARACO","type":"providers"}},"prefixes":{"data":[{"id":"10.14473","type":"prefixes"}]}}}]
/// meta : {"total":1,"totalPages":1,"page":1}

ResponseClientModel responseClientModelFromJson(String str) => ResponseClientModel.fromJson(json.decode(str));

String responseClientModelToJson(ResponseClientModel data) => json.encode(data.toJson());

class ResponseClientModel {
  ResponseClientModel({
      List<ClientData>? data, 
      Meta? meta,}){
    _data = data;
    _meta = meta;
}

  ResponseClientModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ClientData.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<ClientData>? _data;
  Meta? _meta;
ResponseClientModel copyWith({  List<ClientData>? data,
  Meta? meta,
}) => ResponseClientModel(  data: data ?? _data,
  meta: meta ?? _meta,
);
  List<ClientData> get clients => _data ?? [];
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// total : 1
/// totalPages : 1
/// page : 1

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
      num? total, 
      num? totalPages, 
      num? page,}){
    _total = total;
    _totalPages = totalPages;
    _page = page;
}

  Meta.fromJson(dynamic json) {
    _total = json['total'];
    _totalPages = json['totalPages'];
    _page = json['page'];
  }
  num? _total;
  num? _totalPages;
  num? _page;
Meta copyWith({  num? total,
  num? totalPages,
  num? page,
}) => Meta(  total: total ?? _total,
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

/// id : "gesis.csda"
/// type : "clients"
/// attributes : {"name":"Czech Social Science Data Archive","symbol":"GESIS.CSDA","year":2015,"alternateName":null,"description":"The Czech Social Science Data Archive (CSDA) of the Institute of Sociology of the Academy of Sciences of the Czech Republic accesses, processes, documents and stores data files from social science research projects and promotes their dissemination to make them widely available for secondary use in academic research and for educational purposes.","language":[],"clientType":"repository","domains":"*","re3data":"https://doi.org/10.17616/R35P6H","opendoar":null,"issn":{},"url":"https://archiv.soc.cas.cz/en/","created":"2015-04-08T13:50:52Z","updated":"2023-02-17T08:39:46Z","isActive":true}
/// relationships : {"provider":{"data":{"id":"csda","type":"providers"}},"consortium":{"data":{"id":"DARACO","type":"providers"}},"prefixes":{"data":[{"id":"10.14473","type":"prefixes"}]}}

ClientData dataFromJson(String str) => ClientData.fromJson(json.decode(str));

String dataToJson(ClientData data) => json.encode(data.toJson());

class ClientData {
  ClientData({
      String? id, 
      String? type, 
      Attributes? attributes, 
      Relationships? relationships,}){
    _id = id;
    _type = type;
    _attributes = attributes;
    _relationships = relationships;
}

  ClientData.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    _relationships = json['relationships'] != null ? Relationships.fromJson(json['relationships']) : null;
  }
  String? _id;
  String? _type;
  Attributes? _attributes;
  Relationships? _relationships;
ClientData copyWith({  String? id,
  String? type,
  Attributes? attributes,
  Relationships? relationships,
}) => ClientData(  id: id ?? _id,
  type: type ?? _type,
  attributes: attributes ?? _attributes,
  relationships: relationships ?? _relationships,
);
  String? get id => _id;
  String? get type => _type;
  Attributes? get attributes => _attributes;
  Relationships? get relationships => _relationships;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    if (_relationships != null) {
      map['relationships'] = _relationships?.toJson();
    }
    return map;
  }

}

/// provider : {"data":{"id":"csda","type":"providers"}}
/// consortium : {"data":{"id":"DARACO","type":"providers"}}
/// prefixes : {"data":[{"id":"10.14473","type":"prefixes"}]}

Relationships relationshipsFromJson(String str) => Relationships.fromJson(json.decode(str));
String relationshipsToJson(Relationships data) => json.encode(data.toJson());
class Relationships {
  Relationships({
      Provider? provider, 
      Consortium? consortium, 
      Prefixes? prefixes,}){
    _provider = provider;
    _consortium = consortium;
    _prefixes = prefixes;
}

  Relationships.fromJson(dynamic json) {
    _provider = json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    _consortium = json['consortium'] != null ? Consortium.fromJson(json['consortium']) : null;
    _prefixes = json['prefixes'] != null ? Prefixes.fromJson(json['prefixes']) : null;
  }
  Provider? _provider;
  Consortium? _consortium;
  Prefixes? _prefixes;
Relationships copyWith({  Provider? provider,
  Consortium? consortium,
  Prefixes? prefixes,
}) => Relationships(  provider: provider ?? _provider,
  consortium: consortium ?? _consortium,
  prefixes: prefixes ?? _prefixes,
);
  Provider? get provider => _provider;
  Consortium? get consortium => _consortium;
  Prefixes? get prefixes => _prefixes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_provider != null) {
      map['provider'] = _provider?.toJson();
    }
    if (_consortium != null) {
      map['consortium'] = _consortium?.toJson();
    }
    if (_prefixes != null) {
      map['prefixes'] = _prefixes?.toJson();
    }
    return map;
  }

}

/// data : [{"id":"10.14473","type":"prefixes"}]

Prefixes prefixesFromJson(String str) => Prefixes.fromJson(json.decode(str));
String prefixesToJson(Prefixes data) => json.encode(data.toJson());
class Prefixes {
  Prefixes({
      List<ClientData>? data,}){
    _data = data;
}

  Prefixes.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ClientData.fromJson(v));
      });
    }
  }
  List<ClientData>? _data;
Prefixes copyWith({  List<ClientData>? data,
}) => Prefixes(  data: data ?? _data,
);
  List<ClientData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "10.14473"
/// type : "prefixes"

DataRL dataRLFromJson(String str) => DataRL.fromJson(json.decode(str));

String dataRLToJson(DataRL data) => json.encode(data.toJson());

class DataRL {
  DataRL({
      String? id,
      String? type,}){
    _id = id;
    _type = type;
}

  DataRL.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
  }
  String? _id;
  String? _type;
ClientData copyWith({  String? id,
  String? type,
}) => ClientData(  id: id ?? _id,
  type: type ?? _type,
);
  String? get id => _id;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    return map;
  }

}

/// data : {"id":"DARACO","type":"providers"}

Consortium consortiumFromJson(String str) => Consortium.fromJson(json.decode(str));
String consortiumToJson(Consortium data) => json.encode(data.toJson());
class Consortium {
  Consortium({
      ClientData? data,}){
    _data = data;
}

  Consortium.fromJson(dynamic json) {
    _data = json['data'] != null ? ClientData.fromJson(json['data']) : null;
  }
  ClientData? _data;
Consortium copyWith({  ClientData? data,
}) => Consortium(  data: data ?? _data,
);
  ClientData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

Provider providerFromJson(String str) => Provider.fromJson(json.decode(str));
String providerToJson(Provider data) => json.encode(data.toJson());
class Provider {
  Provider({
      ClientData? data,}){
    _data = data;
}

  Provider.fromJson(dynamic json) {
    _data = json['data'] != null ? ClientData.fromJson(json['data']) : null;
  }
  ClientData? _data;
Provider copyWith({  ClientData? data,
}) => Provider(  data: data ?? _data,
);
  ClientData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// name : "Czech Social Science Data Archive"
/// symbol : "GESIS.CSDA"
/// year : 2015
/// alternateName : null
/// description : "The Czech Social Science Data Archive (CSDA) of the Institute of Sociology of the Academy of Sciences of the Czech Republic accesses, processes, documents and stores data files from social science research projects and promotes their dissemination to make them widely available for secondary use in academic research and for educational purposes."
/// language : []
/// clientType : "repository"
/// domains : "*"
/// re3data : "https://doi.org/10.17616/R35P6H"
/// opendoar : null
/// issn : {}
/// url : "https://archiv.soc.cas.cz/en/"
/// created : "2015-04-08T13:50:52Z"
/// updated : "2023-02-17T08:39:46Z"
/// isActive : true

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? name, 
      String? symbol, 
      num? year,
      String? description,
      String? clientType, 
      String? domains, 
      String? re3data,
      String? url, 
      String? created, 
      String? updated, 
      bool? isActive,}){
    _name = name;
    _symbol = symbol;
    _year = year;
    _description = description;
    _clientType = clientType;
    _domains = domains;
    _re3data = re3data;
    _url = url;
    _created = created;
    _updated = updated;
    _isActive = isActive;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _symbol = json['symbol'];
    _year = json['year'];
    _description = json['description'];
    _clientType = json['clientType'];
    _domains = json['domains'];
    _re3data = json['re3data'];
    _url = json['url'];
    _created = json['created'];
    _updated = json['updated'];
    _isActive = json['isActive'];
  }
  String? _name;
  String? _symbol;
  num? _year;
  String? _description;
  String? _clientType;
  String? _domains;
  String? _re3data;
  String? _url;
  String? _created;
  String? _updated;
  bool? _isActive;
Attributes copyWith({  String? name,
  String? symbol,
  num? year,
  dynamic alternateName,
  String? description,
  List<dynamic>? language,
  String? clientType,
  String? domains,
  String? re3data,
  dynamic opendoar,
  dynamic issn,
  String? url,
  String? created,
  String? updated,
  bool? isActive,
}) => Attributes(  name: name ?? _name,
  symbol: symbol ?? _symbol,
  year: year ?? _year,
  description: description ?? _description,
  clientType: clientType ?? _clientType,
  domains: domains ?? _domains,
  re3data: re3data ?? _re3data,
  url: url ?? _url,
  created: created ?? _created,
  updated: updated ?? _updated,
  isActive: isActive ?? _isActive,
);
  String? get name => _name;
  String? get symbol => _symbol;
  num? get year => _year;
  String? get description => _description;
  String? get clientType => _clientType;
  String? get domains => _domains;
  String? get re3data => _re3data;
  String? get url => _url;
  String? get created => _created;
  String? get updated => _updated;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['year'] = _year;
    map['description'] = _description;
    map['clientType'] = _clientType;
    map['domains'] = _domains;
    map['re3data'] = _re3data;
    map['url'] = _url;
    map['created'] = _created;
    map['updated'] = _updated;
    map['isActive'] = _isActive;
    return map;
  }

}