import 'dart:convert';

/// data : [{"id":"10.5160/psychdata.hnja15bi24_v100","type":"dois","attributes":{"doi":"10.5160/psychdata.hnja15bi24_v100","identifiers":[],"creators":[{"name":"Holtmann, Jana","nameType":"Personal","givenName":"Jana","familyName":"Holtmann","affiliation":["Universität Leipzig, Wilhelm-Wundt Institut für Psychologie"],"nameIdentifiers":[]},{"name":"Bohn, Johannes","nameType":"Personal","givenName":"Johannes","familyName":"Bohn","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]},{"name":"Koch, Tobias","nameType":"Personal","givenName":"Tobias","familyName":"Koch","affiliation":["Friedrich-Schiller-Universität Jena"],"nameIdentifiers":[]},{"name":"Luhmann, Maike","nameType":"Personal","givenName":"Maike","familyName":"Luhmann","affiliation":["Ruhr-Universität Bochum"],"nameIdentifiers":[]},{"name":"Eid, Michael","nameType":"Personal","givenName":"Michael","familyName":"Eid","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]}],"titles":[{"lang":"de","title":"Bindung, Einsamkeit und Wohlbefinden im jungen Erwachsenenalter: Primärdaten einer multimethodalen Längsschnittstudie"},{"lang":"en","title":"Attachment, loneliness, and well-being in emerging adulthood: primary data from a multi-method longitudinal study."}],"publisher":"ZPID Leibniz Institute for Psychology","container":{},"publicationYear":2023,"subjects":[{"lang":"en","subject":"10700 Psychology","subjectScheme":"GESIS"},{"lang":"en","subject":"Psychometrics &amp; Statistics &amp; Methodology","subjectScheme":"APA Classification"},{"lang":"en","subject":"Developmental Scales &amp; Schedules","subjectScheme":"APA Classification"},{"lang":"en","subject":"Personality Scales &amp; Inventories","subjectScheme":"APA Classification"},{"lang":"en","subject":"Psychosocial &amp; Personality Development","subjectScheme":"APA Classification"}],"contributors":[],"dates":[{"date":"2023","dateType":"Issued"}],"language":null,"types":{"ris":"DATA","bibtex":"misc","citeproc":"dataset","schemaOrg":"Dataset","resourceTypeGeneral":"Dataset"},"relatedIdentifiers":[{"relationType":"IsNewVersionOf","relatedIdentifier":"10.5160/psychdata.hnja15bi24","relatedIdentifierType":"DOI"}],"relatedItems":[],"sizes":[],"formats":[],"version":"1.1.0","rightsList":[],"descriptions":[{"lang":"de","description":"Die dem Datensatz zugrundeliegende Studie hatte zum Ziel, Veränderungen in den sozialen Beziehungen, der Bindung, Lebenszufriedenheit, Einsamkeit, sowie im subjektiven Wohlbefinden junger Erwachsener im ersten Jahr nach dem Abitur zu erfassen. Hinsichtlich der Bindung wurde die Beziehung zu einem Elternteil, dem / der BeziehungspartnerIn (falls vorhanden), sowie zu maximal 5 FreundInnen berücksichtigt. Es handelt sich um eine multimethodale Längsschnittstudie, in welcher die Veränderung genannter Variablen über die Zeit aus verschiedenen Perspektiven erfasst wurde. Neben der Selbsteinschätzung der verschiedenen Variablen durch die AbiturientInnen (Zielperson) wurden auch 1) die Selbsteinschätzung der Bindung von Beziehungspersonen an die Zielperson, sowie 2) die Fremdeinschätzung verschiedener Eigenschaften der Zielperson durch die verschiedenen Beziehungspersonen erfasst. Fremdeinschätzungen wurden entsprechend von einem Elternteil pro Target (Messzeitpunkte 1-4), dem/der BeziehungspartnerIn (falls vorhanden; Messzeitpunkte 1-4), sowie bis zu 5 FreundInnen (Messzeitpunkte 2-4) erfasst. Die Daten wurden im Rahmen einer Online-Befragung erhoben. Bisherige Analysen der Daten untersuchten a) die Stabilität bzw. Veränderung dyadischer Bindung im jungen Erwachsenenalter, b) die Unterschiedlichkeit der Bindung zu unterschiedlichen Bindungspersonen, c) Bindung aus der Perspektive verschiedener Bindungspersonen, d) die Konvergenz in der Einschätzung von Einsamkeit durch verschiedene Bindungspersonen, e) die konvergente Validität von Selbst-, Freundes-, und Elternratings in der Messung der Veränderung von subjektivem Wohlbefinden.","descriptionType":"Abstract"},{"lang":"en","description":"The study underlying the data set aimed to capture changes in social relationships, attachment, life satisfaction, loneliness, and subjective well-being of emerging adults in the first year after high school graduation. Regarding attachment, the relationship with a parent, the relationship partner(s) (if any), and a maximum of 5 friends were considered. This is a multi-method longitudinal study in which the change of mentioned variables over time was recorded from different perspectives. In addition to the self-assessment of the different variables by the high school graduates (target person), also 1) the self-assessment of the attachment of relationship persons to the target person, as well as 2) the external assessment of different characteristics of the target person by the different relationship partners were recorded. Third-party assessments were recorded accordingly from one parent per target (measurement time points 1-4), the relationship partner(s) (if any; measurement time points 1-4), and up to 5 friends (measurement time points 2-4). Data were collected via an online survey. Previous analyses of the data examined a) the stability or change of dyadic attachment in young adulthood, b) the variability of attachment to different attachment figures, c) attachment from the perspective of different attachment figures, d) convergence in the assessment of loneliness by different attachment figures, e) the convergent validity of self, friend, and parent ratings in measuring change in subjective well-being.","descriptionType":"Abstract"}],"geoLocations":[],"fundingReferences":[],"url":"https://rdc-psychology.org/holtmann_bohn_koch_luhmann_eid_2023-2","contentUrl":null,"metadataVersion":1,"schemaVersion":"http://datacite.org/schema/kernel-4","source":"api","isActive":true,"state":"findable","reason":null,"viewCount":0,"downloadCount":0,"referenceCount":0,"citationCount":0,"partCount":0,"partOfCount":0,"versionCount":0,"versionOfCount":0,"created":"2023-05-03T10:49:36Z","registered":"2023-05-03T10:49:36Z","published":null,"updated":"2023-05-03T23:30:04Z"},"relationships":{"client":{"data":{"id":"gesis.zpid","type":"clients"}}}}]
/// meta : {"total":80,"totalPages":80,"page":1}

ResponseDoiModel responseDioModelFromJson(String str) =>
    ResponseDoiModel.fromJson(json.decode(str));

String responseDioModelToJson(ResponseDoiModel data) =>
    json.encode(data.toJson());

class ResponseDoiModel {
  ResponseDoiModel({
    List<DoiData>? data,
    Meta? meta,
  }) {
    _data = data;
    _meta = meta;
  }

  ResponseDoiModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DoiData.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<DoiData>? _data;
  Meta? _meta;

  ResponseDoiModel copyWith({
    List<DoiData>? data,
    Meta? meta,
  }) =>
      ResponseDoiModel(
        data: data ?? _data,
        meta: meta ?? _meta,
      );

  List<DoiData> get dois => _data ?? [];

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

/// total : 80
/// totalPages : 80
/// page : 1

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
    num? total,
    num? totalPages,
    num? page,
  }) {
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

  Meta copyWith({
    num? total,
    num? totalPages,
    num? page,
  }) =>
      Meta(
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

/// id : "10.5160/psychdata.hnja15bi24_v100"
/// type : "dois"
/// attributes : {"doi":"10.5160/psychdata.hnja15bi24_v100","identifiers":[],"creators":[{"name":"Holtmann, Jana","nameType":"Personal","givenName":"Jana","familyName":"Holtmann","affiliation":["Universität Leipzig, Wilhelm-Wundt Institut für Psychologie"],"nameIdentifiers":[]},{"name":"Bohn, Johannes","nameType":"Personal","givenName":"Johannes","familyName":"Bohn","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]},{"name":"Koch, Tobias","nameType":"Personal","givenName":"Tobias","familyName":"Koch","affiliation":["Friedrich-Schiller-Universität Jena"],"nameIdentifiers":[]},{"name":"Luhmann, Maike","nameType":"Personal","givenName":"Maike","familyName":"Luhmann","affiliation":["Ruhr-Universität Bochum"],"nameIdentifiers":[]},{"name":"Eid, Michael","nameType":"Personal","givenName":"Michael","familyName":"Eid","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]}],"titles":[{"lang":"de","title":"Bindung, Einsamkeit und Wohlbefinden im jungen Erwachsenenalter: Primärdaten einer multimethodalen Längsschnittstudie"},{"lang":"en","title":"Attachment, loneliness, and well-being in emerging adulthood: primary data from a multi-method longitudinal study."}],"publisher":"ZPID Leibniz Institute for Psychology","container":{},"publicationYear":2023,"subjects":[{"lang":"en","subject":"10700 Psychology","subjectScheme":"GESIS"},{"lang":"en","subject":"Psychometrics &amp; Statistics &amp; Methodology","subjectScheme":"APA Classification"},{"lang":"en","subject":"Developmental Scales &amp; Schedules","subjectScheme":"APA Classification"},{"lang":"en","subject":"Personality Scales &amp; Inventories","subjectScheme":"APA Classification"},{"lang":"en","subject":"Psychosocial &amp; Personality Development","subjectScheme":"APA Classification"}],"contributors":[],"dates":[{"date":"2023","dateType":"Issued"}],"language":null,"types":{"ris":"DATA","bibtex":"misc","citeproc":"dataset","schemaOrg":"Dataset","resourceTypeGeneral":"Dataset"},"relatedIdentifiers":[{"relationType":"IsNewVersionOf","relatedIdentifier":"10.5160/psychdata.hnja15bi24","relatedIdentifierType":"DOI"}],"relatedItems":[],"sizes":[],"formats":[],"version":"1.1.0","rightsList":[],"descriptions":[{"lang":"de","description":"Die dem Datensatz zugrundeliegende Studie hatte zum Ziel, Veränderungen in den sozialen Beziehungen, der Bindung, Lebenszufriedenheit, Einsamkeit, sowie im subjektiven Wohlbefinden junger Erwachsener im ersten Jahr nach dem Abitur zu erfassen. Hinsichtlich der Bindung wurde die Beziehung zu einem Elternteil, dem / der BeziehungspartnerIn (falls vorhanden), sowie zu maximal 5 FreundInnen berücksichtigt. Es handelt sich um eine multimethodale Längsschnittstudie, in welcher die Veränderung genannter Variablen über die Zeit aus verschiedenen Perspektiven erfasst wurde. Neben der Selbsteinschätzung der verschiedenen Variablen durch die AbiturientInnen (Zielperson) wurden auch 1) die Selbsteinschätzung der Bindung von Beziehungspersonen an die Zielperson, sowie 2) die Fremdeinschätzung verschiedener Eigenschaften der Zielperson durch die verschiedenen Beziehungspersonen erfasst. Fremdeinschätzungen wurden entsprechend von einem Elternteil pro Target (Messzeitpunkte 1-4), dem/der BeziehungspartnerIn (falls vorhanden; Messzeitpunkte 1-4), sowie bis zu 5 FreundInnen (Messzeitpunkte 2-4) erfasst. Die Daten wurden im Rahmen einer Online-Befragung erhoben. Bisherige Analysen der Daten untersuchten a) die Stabilität bzw. Veränderung dyadischer Bindung im jungen Erwachsenenalter, b) die Unterschiedlichkeit der Bindung zu unterschiedlichen Bindungspersonen, c) Bindung aus der Perspektive verschiedener Bindungspersonen, d) die Konvergenz in der Einschätzung von Einsamkeit durch verschiedene Bindungspersonen, e) die konvergente Validität von Selbst-, Freundes-, und Elternratings in der Messung der Veränderung von subjektivem Wohlbefinden.","descriptionType":"Abstract"},{"lang":"en","description":"The study underlying the data set aimed to capture changes in social relationships, attachment, life satisfaction, loneliness, and subjective well-being of emerging adults in the first year after high school graduation. Regarding attachment, the relationship with a parent, the relationship partner(s) (if any), and a maximum of 5 friends were considered. This is a multi-method longitudinal study in which the change of mentioned variables over time was recorded from different perspectives. In addition to the self-assessment of the different variables by the high school graduates (target person), also 1) the self-assessment of the attachment of relationship persons to the target person, as well as 2) the external assessment of different characteristics of the target person by the different relationship partners were recorded. Third-party assessments were recorded accordingly from one parent per target (measurement time points 1-4), the relationship partner(s) (if any; measurement time points 1-4), and up to 5 friends (measurement time points 2-4). Data were collected via an online survey. Previous analyses of the data examined a) the stability or change of dyadic attachment in young adulthood, b) the variability of attachment to different attachment figures, c) attachment from the perspective of different attachment figures, d) convergence in the assessment of loneliness by different attachment figures, e) the convergent validity of self, friend, and parent ratings in measuring change in subjective well-being.","descriptionType":"Abstract"}],"geoLocations":[],"fundingReferences":[],"url":"https://rdc-psychology.org/holtmann_bohn_koch_luhmann_eid_2023-2","contentUrl":null,"metadataVersion":1,"schemaVersion":"http://datacite.org/schema/kernel-4","source":"api","isActive":true,"state":"findable","reason":null,"viewCount":0,"downloadCount":0,"referenceCount":0,"citationCount":0,"partCount":0,"partOfCount":0,"versionCount":0,"versionOfCount":0,"created":"2023-05-03T10:49:36Z","registered":"2023-05-03T10:49:36Z","published":null,"updated":"2023-05-03T23:30:04Z"}
/// relationships : {"client":{"data":{"id":"gesis.zpid","type":"clients"}}}

DoiData dataFromJson(String str) => DoiData.fromJson(json.decode(str));

String dataToJson(DoiData data) => json.encode(data.toJson());

class DoiData {
  DoiData({
    String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,
  }) {
    _id = id;
    _type = type;
    _attributes = attributes;
    _relationships = relationships;
  }

  DoiData.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    _relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  String? _id;
  String? _type;
  Attributes? _attributes;
  Relationships? _relationships;

  DoiData copyWith({
    String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,
  }) =>
      DoiData(
        id: id ?? _id,
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

/// client : {"data":{"id":"gesis.zpid","type":"clients"}}

Relationships relationshipsFromJson(String str) =>
    Relationships.fromJson(json.decode(str));

String relationshipsToJson(Relationships data) => json.encode(data.toJson());

class Relationships {
  Relationships({
    Client? client,
  }) {
    _client = client;
  }

  Relationships.fromJson(dynamic json) {
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }

  Client? _client;

  Relationships copyWith({
    Client? client,
  }) =>
      Relationships(
        client: client ?? _client,
      );

  Client? get client => _client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    return map;
  }
}

/// data : {"id":"gesis.zpid","type":"clients"}

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    DoiData? data,
  }) {
    _data = data;
  }

  Client.fromJson(dynamic json) {
    _data = json['data'] != null ? DoiData.fromJson(json['data']) : null;
  }

  DoiData? _data;

  Client copyWith({
    DoiData? data,
  }) =>
      Client(
        data: data ?? _data,
      );

  DoiData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// doi : "10.5160/psychdata.hnja15bi24_v100"
/// identifiers : []
/// creators : [{"name":"Holtmann, Jana","nameType":"Personal","givenName":"Jana","familyName":"Holtmann","affiliation":["Universität Leipzig, Wilhelm-Wundt Institut für Psychologie"],"nameIdentifiers":[]},{"name":"Bohn, Johannes","nameType":"Personal","givenName":"Johannes","familyName":"Bohn","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]},{"name":"Koch, Tobias","nameType":"Personal","givenName":"Tobias","familyName":"Koch","affiliation":["Friedrich-Schiller-Universität Jena"],"nameIdentifiers":[]},{"name":"Luhmann, Maike","nameType":"Personal","givenName":"Maike","familyName":"Luhmann","affiliation":["Ruhr-Universität Bochum"],"nameIdentifiers":[]},{"name":"Eid, Michael","nameType":"Personal","givenName":"Michael","familyName":"Eid","affiliation":["Freie Universität Berlin"],"nameIdentifiers":[]}]
/// titles : [{"lang":"de","title":"Bindung, Einsamkeit und Wohlbefinden im jungen Erwachsenenalter: Primärdaten einer multimethodalen Längsschnittstudie"},{"lang":"en","title":"Attachment, loneliness, and well-being in emerging adulthood: primary data from a multi-method longitudinal study."}]
/// publisher : "ZPID Leibniz Institute for Psychology"
/// container : {}
/// publicationYear : 2023
/// subjects : [{"lang":"en","subject":"10700 Psychology","subjectScheme":"GESIS"},{"lang":"en","subject":"Psychometrics &amp; Statistics &amp; Methodology","subjectScheme":"APA Classification"},{"lang":"en","subject":"Developmental Scales &amp; Schedules","subjectScheme":"APA Classification"},{"lang":"en","subject":"Personality Scales &amp; Inventories","subjectScheme":"APA Classification"},{"lang":"en","subject":"Psychosocial &amp; Personality Development","subjectScheme":"APA Classification"}]
/// contributors : []
/// dates : [{"date":"2023","dateType":"Issued"}]
/// language : null
/// types : {"ris":"DATA","bibtex":"misc","citeproc":"dataset","schemaOrg":"Dataset","resourceTypeGeneral":"Dataset"}
/// relatedIdentifiers : [{"relationType":"IsNewVersionOf","relatedIdentifier":"10.5160/psychdata.hnja15bi24","relatedIdentifierType":"DOI"}]
/// relatedItems : []
/// sizes : []
/// formats : []
/// version : "1.1.0"
/// rightsList : []
/// descriptions : [{"lang":"de","description":"Die dem Datensatz zugrundeliegende Studie hatte zum Ziel, Veränderungen in den sozialen Beziehungen, der Bindung, Lebenszufriedenheit, Einsamkeit, sowie im subjektiven Wohlbefinden junger Erwachsener im ersten Jahr nach dem Abitur zu erfassen. Hinsichtlich der Bindung wurde die Beziehung zu einem Elternteil, dem / der BeziehungspartnerIn (falls vorhanden), sowie zu maximal 5 FreundInnen berücksichtigt. Es handelt sich um eine multimethodale Längsschnittstudie, in welcher die Veränderung genannter Variablen über die Zeit aus verschiedenen Perspektiven erfasst wurde. Neben der Selbsteinschätzung der verschiedenen Variablen durch die AbiturientInnen (Zielperson) wurden auch 1) die Selbsteinschätzung der Bindung von Beziehungspersonen an die Zielperson, sowie 2) die Fremdeinschätzung verschiedener Eigenschaften der Zielperson durch die verschiedenen Beziehungspersonen erfasst. Fremdeinschätzungen wurden entsprechend von einem Elternteil pro Target (Messzeitpunkte 1-4), dem/der BeziehungspartnerIn (falls vorhanden; Messzeitpunkte 1-4), sowie bis zu 5 FreundInnen (Messzeitpunkte 2-4) erfasst. Die Daten wurden im Rahmen einer Online-Befragung erhoben. Bisherige Analysen der Daten untersuchten a) die Stabilität bzw. Veränderung dyadischer Bindung im jungen Erwachsenenalter, b) die Unterschiedlichkeit der Bindung zu unterschiedlichen Bindungspersonen, c) Bindung aus der Perspektive verschiedener Bindungspersonen, d) die Konvergenz in der Einschätzung von Einsamkeit durch verschiedene Bindungspersonen, e) die konvergente Validität von Selbst-, Freundes-, und Elternratings in der Messung der Veränderung von subjektivem Wohlbefinden.","descriptionType":"Abstract"},{"lang":"en","description":"The study underlying the data set aimed to capture changes in social relationships, attachment, life satisfaction, loneliness, and subjective well-being of emerging adults in the first year after high school graduation. Regarding attachment, the relationship with a parent, the relationship partner(s) (if any), and a maximum of 5 friends were considered. This is a multi-method longitudinal study in which the change of mentioned variables over time was recorded from different perspectives. In addition to the self-assessment of the different variables by the high school graduates (target person), also 1) the self-assessment of the attachment of relationship persons to the target person, as well as 2) the external assessment of different characteristics of the target person by the different relationship partners were recorded. Third-party assessments were recorded accordingly from one parent per target (measurement time points 1-4), the relationship partner(s) (if any; measurement time points 1-4), and up to 5 friends (measurement time points 2-4). Data were collected via an online survey. Previous analyses of the data examined a) the stability or change of dyadic attachment in young adulthood, b) the variability of attachment to different attachment figures, c) attachment from the perspective of different attachment figures, d) convergence in the assessment of loneliness by different attachment figures, e) the convergent validity of self, friend, and parent ratings in measuring change in subjective well-being.","descriptionType":"Abstract"}]
/// geoLocations : []
/// fundingReferences : []
/// url : "https://rdc-psychology.org/holtmann_bohn_koch_luhmann_eid_2023-2"
/// contentUrl : null
/// metadataVersion : 1
/// schemaVersion : "http://datacite.org/schema/kernel-4"
/// source : "api"
/// isActive : true
/// state : "findable"
/// reason : null
/// viewCount : 0
/// downloadCount : 0
/// referenceCount : 0
/// citationCount : 0
/// partCount : 0
/// partOfCount : 0
/// versionCount : 0
/// versionOfCount : 0
/// created : "2023-05-03T10:49:36Z"
/// registered : "2023-05-03T10:49:36Z"
/// published : null
/// updated : "2023-05-03T23:30:04Z"

Attributes attributesFromJson(String str) =>
    Attributes.fromJson(json.decode(str));

String attributesToJson(Attributes data) => json.encode(data.toJson());

class Attributes {
  Attributes({
    String? doi,
    List<Creators>? creators,
    List<Titles>? titles,
    String? publisher,
    num? publicationYear,
    List<Subjects>? subjects,
    List<Dates>? dates,
    Types? types,
    List<RelatedIdentifiers>? relatedIdentifiers,
    String? version,
    List<Descriptions>? descriptions,
    String? url,
    num? metadataVersion,
    String? schemaVersion,
    String? source,
    bool? isActive,
    String? state,
    num? viewCount,
    num? downloadCount,
    num? referenceCount,
    num? citationCount,
    num? partCount,
    num? partOfCount,
    num? versionCount,
    num? versionOfCount,
    String? created,
    String? registered,
    String? updated,
  }) {
    _doi = doi;
    _creators = creators;
    _titles = titles;
    _publisher = publisher;
    _publicationYear = publicationYear;
    _subjects = subjects;
    _dates = dates;
    _types = types;
    _relatedIdentifiers = relatedIdentifiers;
    _version = version;
    _descriptions = descriptions;
    _url = url;
    _metadataVersion = metadataVersion;
    _schemaVersion = schemaVersion;
    _source = source;
    _isActive = isActive;
    _state = state;
    _viewCount = viewCount;
    _downloadCount = downloadCount;
    _referenceCount = referenceCount;
    _citationCount = citationCount;
    _partCount = partCount;
    _partOfCount = partOfCount;
    _versionCount = versionCount;
    _versionOfCount = versionOfCount;
    _created = created;
    _registered = registered;
    _updated = updated;
  }

  Attributes.fromJson(dynamic json) {
    _doi = json['doi'];
    if (json['creators'] != null) {
      _creators = [];
      json['creators'].forEach((v) {
        _creators?.add(Creators.fromJson(v));
      });
    }
    if (json['titles'] != null) {
      _titles = [];
      json['titles'].forEach((v) {
        _titles?.add(Titles.fromJson(v));
      });
    }
    _publisher = json['publisher'];
    _publicationYear = json['publicationYear'];
    if (json['subjects'] != null) {
      _subjects = [];
      json['subjects'].forEach((v) {
        _subjects?.add(Subjects.fromJson(v));
      });
    }

    if (json['dates'] != null) {
      _dates = [];
      json['dates'].forEach((v) {
        _dates?.add(Dates.fromJson(v));
      });
    }

    _types = json['types'] != null ? Types.fromJson(json['types']) : null;
    if (json['relatedIdentifiers'] != null) {
      _relatedIdentifiers = [];
      json['relatedIdentifiers'].forEach((v) {
        _relatedIdentifiers?.add(RelatedIdentifiers.fromJson(v));
      });
    }

    _version = json['version'];

    if (json['descriptions'] != null) {
      _descriptions = [];
      json['descriptions'].forEach((v) {
        _descriptions?.add(Descriptions.fromJson(v));
      });
    }
    _url = json['url'];
    _metadataVersion = json['metadataVersion'];
    _schemaVersion = json['schemaVersion'];
    _source = json['source'];
    _isActive = json['isActive'];
    _state = json['state'];
    _viewCount = json['viewCount'];
    _downloadCount = json['downloadCount'];
    _referenceCount = json['referenceCount'];
    _citationCount = json['citationCount'];
    _partCount = json['partCount'];
    _partOfCount = json['partOfCount'];
    _versionCount = json['versionCount'];
    _versionOfCount = json['versionOfCount'];
    _created = json['created'];
    _registered = json['registered'];
    _updated = json['updated'];
  }

  String? _doi;
  List<Creators>? _creators;
  List<Titles>? _titles;
  String? _publisher;
  num? _publicationYear;
  List<Subjects>? _subjects;
  List<Dates>? _dates;
  Types? _types;
  List<RelatedIdentifiers>? _relatedIdentifiers;
  String? _version;
  List<Descriptions>? _descriptions;
  String? _url;
  num? _metadataVersion;
  String? _schemaVersion;
  String? _source;
  bool? _isActive;
  String? _state;
  num? _viewCount;
  num? _downloadCount;
  num? _referenceCount;
  num? _citationCount;
  num? _partCount;
  num? _partOfCount;
  num? _versionCount;
  num? _versionOfCount;
  String? _created;
  String? _registered;
  String? _updated;

  Attributes copyWith({
    String? doi,
    List<Creators>? creators,
    List<Titles>? titles,
    String? publisher,
    num? publicationYear,
    List<Subjects>? subjects,
    List<Dates>? dates,
    Types? types,
    List<RelatedIdentifiers>? relatedIdentifiers,
    String? version,
    List<Descriptions>? descriptions,
    String? url,
    num? metadataVersion,
    String? schemaVersion,
    String? source,
    bool? isActive,
    String? state,
    num? viewCount,
    num? downloadCount,
    num? referenceCount,
    num? citationCount,
    num? partCount,
    num? partOfCount,
    num? versionCount,
    num? versionOfCount,
    String? created,
    String? registered,
    String? updated,
  }) =>
      Attributes(
        doi: doi ?? _doi,
        creators: creators ?? _creators,
        titles: titles ?? _titles,
        publisher: publisher ?? _publisher,
        publicationYear: publicationYear ?? _publicationYear,
        subjects: subjects ?? _subjects,
        dates: dates ?? _dates,
        types: types ?? _types,
        relatedIdentifiers: relatedIdentifiers ?? _relatedIdentifiers,
        version: version ?? _version,
        descriptions: descriptions ?? _descriptions,
        url: url ?? _url,
        metadataVersion: metadataVersion ?? _metadataVersion,
        schemaVersion: schemaVersion ?? _schemaVersion,
        source: source ?? _source,
        isActive: isActive ?? _isActive,
        state: state ?? _state,
        viewCount: viewCount ?? _viewCount,
        downloadCount: downloadCount ?? _downloadCount,
        referenceCount: referenceCount ?? _referenceCount,
        citationCount: citationCount ?? _citationCount,
        partCount: partCount ?? _partCount,
        partOfCount: partOfCount ?? _partOfCount,
        versionCount: versionCount ?? _versionCount,
        versionOfCount: versionOfCount ?? _versionOfCount,
        created: created ?? _created,
        registered: registered ?? _registered,
        updated: updated ?? _updated,
      );

  String? get doi => _doi;

  List<Creators>? get creators => _creators;

  List<Titles>? get titles => _titles;

  String? get publisher => _publisher;

  num? get publicationYear => _publicationYear;

  List<Subjects>? get subjects => _subjects;

  List<Dates>? get dates => _dates;

  Types? get types => _types;

  List<RelatedIdentifiers>? get relatedIdentifiers => _relatedIdentifiers;

  String? get version => _version;

  List<Descriptions>? get descriptions => _descriptions;

  String? get url => _url;

  num? get metadataVersion => _metadataVersion;

  String? get schemaVersion => _schemaVersion;

  String? get source => _source;

  bool? get isActive => _isActive;

  String? get state => _state;

  num? get viewCount => _viewCount;

  num? get downloadCount => _downloadCount;

  num? get referenceCount => _referenceCount;

  num? get citationCount => _citationCount;

  num? get partCount => _partCount;

  num? get partOfCount => _partOfCount;

  num? get versionCount => _versionCount;

  num? get versionOfCount => _versionOfCount;

  String? get created => _created;

  String? get registered => _registered;

  String? get updated => _updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doi'] = _doi;
    if (_creators != null) {
      map['creators'] = _creators?.map((v) => v.toJson()).toList();
    }
    if (_titles != null) {
      map['titles'] = _titles?.map((v) => v.toJson()).toList();
    }
    map['publisher'] = _publisher;
    map['publicationYear'] = _publicationYear;
    if (_subjects != null) {
      map['subjects'] = _subjects?.map((v) => v.toJson()).toList();
    }

    if (_dates != null) {
      map['dates'] = _dates?.map((v) => v.toJson()).toList();
    }

    if (_types != null) {
      map['types'] = _types?.toJson();
    }
    if (_relatedIdentifiers != null) {
      map['relatedIdentifiers'] =
          _relatedIdentifiers?.map((v) => v.toJson()).toList();
    }

    if (_descriptions != null) {
      map['descriptions'] = _descriptions?.map((v) => v.toJson()).toList();
    }

    map['url'] = _url;
    map['metadataVersion'] = _metadataVersion;
    map['schemaVersion'] = _schemaVersion;
    map['source'] = _source;
    map['isActive'] = _isActive;
    map['state'] = _state;
    map['viewCount'] = _viewCount;
    map['downloadCount'] = _downloadCount;
    map['referenceCount'] = _referenceCount;
    map['citationCount'] = _citationCount;
    map['partCount'] = _partCount;
    map['partOfCount'] = _partOfCount;
    map['versionCount'] = _versionCount;
    map['versionOfCount'] = _versionOfCount;
    map['created'] = _created;
    map['registered'] = _registered;
    map['updated'] = _updated;
    return map;
  }
}

/// lang : "de"
/// description : "Die dem Datensatz zugrundeliegende Studie hatte zum Ziel, Veränderungen in den sozialen Beziehungen, der Bindung, Lebenszufriedenheit, Einsamkeit, sowie im subjektiven Wohlbefinden junger Erwachsener im ersten Jahr nach dem Abitur zu erfassen. Hinsichtlich der Bindung wurde die Beziehung zu einem Elternteil, dem / der BeziehungspartnerIn (falls vorhanden), sowie zu maximal 5 FreundInnen berücksichtigt. Es handelt sich um eine multimethodale Längsschnittstudie, in welcher die Veränderung genannter Variablen über die Zeit aus verschiedenen Perspektiven erfasst wurde. Neben der Selbsteinschätzung der verschiedenen Variablen durch die AbiturientInnen (Zielperson) wurden auch 1) die Selbsteinschätzung der Bindung von Beziehungspersonen an die Zielperson, sowie 2) die Fremdeinschätzung verschiedener Eigenschaften der Zielperson durch die verschiedenen Beziehungspersonen erfasst. Fremdeinschätzungen wurden entsprechend von einem Elternteil pro Target (Messzeitpunkte 1-4), dem/der BeziehungspartnerIn (falls vorhanden; Messzeitpunkte 1-4), sowie bis zu 5 FreundInnen (Messzeitpunkte 2-4) erfasst. Die Daten wurden im Rahmen einer Online-Befragung erhoben. Bisherige Analysen der Daten untersuchten a) die Stabilität bzw. Veränderung dyadischer Bindung im jungen Erwachsenenalter, b) die Unterschiedlichkeit der Bindung zu unterschiedlichen Bindungspersonen, c) Bindung aus der Perspektive verschiedener Bindungspersonen, d) die Konvergenz in der Einschätzung von Einsamkeit durch verschiedene Bindungspersonen, e) die konvergente Validität von Selbst-, Freundes-, und Elternratings in der Messung der Veränderung von subjektivem Wohlbefinden."
/// descriptionType : "Abstract"

Descriptions descriptionsFromJson(String str) =>
    Descriptions.fromJson(json.decode(str));

String descriptionsToJson(Descriptions data) => json.encode(data.toJson());

class Descriptions {
  Descriptions({
    String? lang,
    String? description,
    String? descriptionType,
  }) {
    _lang = lang;
    _description = description;
    _descriptionType = descriptionType;
  }

  Descriptions.fromJson(dynamic json) {
    _lang = json['lang'];
    _description = json['description'];
    _descriptionType = json['descriptionType'];
  }

  String? _lang;
  String? _description;
  String? _descriptionType;

  Descriptions copyWith({
    String? lang,
    String? description,
    String? descriptionType,
  }) =>
      Descriptions(
        lang: lang ?? _lang,
        description: description ?? _description,
        descriptionType: descriptionType ?? _descriptionType,
      );

  String? get lang => _lang;

  String? get description => _description;

  String? get descriptionType => _descriptionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = _lang;
    map['description'] = _description;
    map['descriptionType'] = _descriptionType;
    return map;
  }
}

/// relationType : "IsNewVersionOf"
/// relatedIdentifier : "10.5160/psychdata.hnja15bi24"
/// relatedIdentifierType : "DOI"

RelatedIdentifiers relatedIdentifiersFromJson(String str) =>
    RelatedIdentifiers.fromJson(json.decode(str));

String relatedIdentifiersToJson(RelatedIdentifiers data) =>
    json.encode(data.toJson());

class RelatedIdentifiers {
  RelatedIdentifiers({
    String? relationType,
    String? relatedIdentifier,
    String? relatedIdentifierType,
  }) {
    _relationType = relationType;
    _relatedIdentifier = relatedIdentifier;
    _relatedIdentifierType = relatedIdentifierType;
  }

  RelatedIdentifiers.fromJson(dynamic json) {
    _relationType = json['relationType'];
    _relatedIdentifier = json['relatedIdentifier'];
    _relatedIdentifierType = json['relatedIdentifierType'];
  }

  String? _relationType;
  String? _relatedIdentifier;
  String? _relatedIdentifierType;

  RelatedIdentifiers copyWith({
    String? relationType,
    String? relatedIdentifier,
    String? relatedIdentifierType,
  }) =>
      RelatedIdentifiers(
        relationType: relationType ?? _relationType,
        relatedIdentifier: relatedIdentifier ?? _relatedIdentifier,
        relatedIdentifierType: relatedIdentifierType ?? _relatedIdentifierType,
      );

  String? get relationType => _relationType;

  String? get relatedIdentifier => _relatedIdentifier;

  String? get relatedIdentifierType => _relatedIdentifierType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['relationType'] = _relationType;
    map['relatedIdentifier'] = _relatedIdentifier;
    map['relatedIdentifierType'] = _relatedIdentifierType;
    return map;
  }
}

/// ris : "DATA"
/// bibtex : "misc"
/// citeproc : "dataset"
/// schemaOrg : "Dataset"
/// resourceTypeGeneral : "Dataset"

Types typesFromJson(String str) => Types.fromJson(json.decode(str));

String typesToJson(Types data) => json.encode(data.toJson());

class Types {
  Types({
    String? ris,
    String? bibtex,
    String? citeproc,
    String? schemaOrg,
    String? resourceTypeGeneral,
  }) {
    _ris = ris;
    _bibtex = bibtex;
    _citeproc = citeproc;
    _schemaOrg = schemaOrg;
    _resourceTypeGeneral = resourceTypeGeneral;
  }

  Types.fromJson(dynamic json) {
    _ris = json['ris'];
    _bibtex = json['bibtex'];
    _citeproc = json['citeproc'];
    _schemaOrg = json['schemaOrg'];
    _resourceTypeGeneral = json['resourceTypeGeneral'];
  }

  String? _ris;
  String? _bibtex;
  String? _citeproc;
  String? _schemaOrg;
  String? _resourceTypeGeneral;

  Types copyWith({
    String? ris,
    String? bibtex,
    String? citeproc,
    String? schemaOrg,
    String? resourceTypeGeneral,
  }) =>
      Types(
        ris: ris ?? _ris,
        bibtex: bibtex ?? _bibtex,
        citeproc: citeproc ?? _citeproc,
        schemaOrg: schemaOrg ?? _schemaOrg,
        resourceTypeGeneral: resourceTypeGeneral ?? _resourceTypeGeneral,
      );

  String? get ris => _ris;

  String? get bibtex => _bibtex;

  String? get citeproc => _citeproc;

  String? get schemaOrg => _schemaOrg;

  String? get resourceTypeGeneral => _resourceTypeGeneral;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ris'] = _ris;
    map['bibtex'] = _bibtex;
    map['citeproc'] = _citeproc;
    map['schemaOrg'] = _schemaOrg;
    map['resourceTypeGeneral'] = _resourceTypeGeneral;
    return map;
  }
}

/// date : "2023"
/// dateType : "Issued"

Dates datesFromJson(String str) => Dates.fromJson(json.decode(str));

String datesToJson(Dates data) => json.encode(data.toJson());

class Dates {
  Dates({
    String? date,
    String? dateType,
  }) {
    _date = date;
    _dateType = dateType;
  }

  Dates.fromJson(dynamic json) {
    _date = json['date'];
    _dateType = json['dateType'];
  }

  String? _date;
  String? _dateType;

  Dates copyWith({
    String? date,
    String? dateType,
  }) =>
      Dates(
        date: date ?? _date,
        dateType: dateType ?? _dateType,
      );

  String? get date => _date;

  String? get dateType => _dateType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['dateType'] = _dateType;
    return map;
  }
}

/// lang : "en"
/// subject : "10700 Psychology"
/// subjectScheme : "GESIS"

Subjects subjectsFromJson(String str) => Subjects.fromJson(json.decode(str));

String subjectsToJson(Subjects data) => json.encode(data.toJson());

class Subjects {
  Subjects({
    String? lang,
    String? subject,
    String? subjectScheme,
  }) {
    _lang = lang;
    _subject = subject;
    _subjectScheme = subjectScheme;
  }

  Subjects.fromJson(dynamic json) {
    _lang = json['lang'];
    _subject = json['subject'];
    _subjectScheme = json['subjectScheme'];
  }

  String? _lang;
  String? _subject;
  String? _subjectScheme;

  Subjects copyWith({
    String? lang,
    String? subject,
    String? subjectScheme,
  }) =>
      Subjects(
        lang: lang ?? _lang,
        subject: subject ?? _subject,
        subjectScheme: subjectScheme ?? _subjectScheme,
      );

  String? get lang => _lang;

  String? get subject => _subject;

  String? get subjectScheme => _subjectScheme;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = _lang;
    map['subject'] = _subject;
    map['subjectScheme'] = _subjectScheme;
    return map;
  }
}

/// lang : "de"
/// title : "Bindung, Einsamkeit und Wohlbefinden im jungen Erwachsenenalter: Primärdaten einer multimethodalen Längsschnittstudie"

Titles titlesFromJson(String str) => Titles.fromJson(json.decode(str));

String titlesToJson(Titles data) => json.encode(data.toJson());

class Titles {
  Titles({
    String? lang,
    String? title,
  }) {
    _lang = lang;
    _title = title;
  }

  Titles.fromJson(dynamic json) {
    _lang = json['lang'];
    _title = json['title'];
  }

  String? _lang;
  String? _title;

  Titles copyWith({
    String? lang,
    String? title,
  }) =>
      Titles(
        lang: lang ?? _lang,
        title: title ?? _title,
      );

  String? get lang => _lang;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = _lang;
    map['title'] = _title;
    return map;
  }
}

/// name : "Holtmann, Jana"
/// nameType : "Personal"
/// givenName : "Jana"
/// familyName : "Holtmann"
/// affiliation : ["Universität Leipzig, Wilhelm-Wundt Institut für Psychologie"]
/// nameIdentifiers : []

Creators creatorsFromJson(String str) => Creators.fromJson(json.decode(str));

String creatorsToJson(Creators data) => json.encode(data.toJson());

class Creators {
  Creators({
    String? name,
    String? nameType,
    String? givenName,
    String? familyName,
    List<String>? affiliation,
    List<dynamic>? nameIdentifiers,
  }) {
    _name = name;
    _nameType = nameType;
    _givenName = givenName;
    _familyName = familyName;
    _affiliation = affiliation;
    _nameIdentifiers = nameIdentifiers;
  }

  Creators.fromJson(dynamic json) {
    _name = json['name'];
    _nameType = json['nameType'];
    _givenName = json['givenName'];
    _familyName = json['familyName'];
    _affiliation =
        json['affiliation'] != null ? json['affiliation'].cast<String>() : [];
  }

  String? _name;
  String? _nameType;
  String? _givenName;
  String? _familyName;
  List<String>? _affiliation;
  List<dynamic>? _nameIdentifiers;

  Creators copyWith({
    String? name,
    String? nameType,
    String? givenName,
    String? familyName,
    List<String>? affiliation,
    List<dynamic>? nameIdentifiers,
  }) =>
      Creators(
        name: name ?? _name,
        nameType: nameType ?? _nameType,
        givenName: givenName ?? _givenName,
        familyName: familyName ?? _familyName,
        affiliation: affiliation ?? _affiliation,
        nameIdentifiers: nameIdentifiers ?? _nameIdentifiers,
      );

  String? get name => _name;

  String? get nameType => _nameType;

  String? get givenName => _givenName;

  String? get familyName => _familyName;

  List<String>? get affiliation => _affiliation;

  List<dynamic>? get nameIdentifiers => _nameIdentifiers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['nameType'] = _nameType;
    map['givenName'] = _givenName;
    map['familyName'] = _familyName;
    map['affiliation'] = _affiliation;
    if (_nameIdentifiers != null) {
      map['nameIdentifiers'] =
          _nameIdentifiers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
