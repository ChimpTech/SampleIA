// To parse this JSON data, do
//
//     final recommendedResponse = recommendedResponseFromJson(jsonString);

import 'dart:convert';

Recommended recommendedFromJson(String str) =>
    Recommended.fromJson(json.decode(str));

String recommendedToJson(Recommended data) => json.encode(data.toJson());

class Recommended {
  Recommended({
    required this.meta,
    required this.data,
  });

  Meta meta;
  List<Datum> data;

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.type,
    required this.attributes,
  });

  String type;
  Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.charityId,
    required this.groupId,
    required this.name,
    required this.businessNumber,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.causes,
    required this.causegroup,
    required this.tags,
    required this.city,
    required this.province,
    required this.type,
    required this.isCampaign,
    required this.campaignId,
    required this.avatar,
    required this.location,
    required this.graphid,
    required this.causeweight,
    required this.geoDistance,
  });

  int charityId;
  int groupId;
  String name;
  String businessNumber;
  String slug;
  int createdAt;
  int updatedAt;
  List<String> causes;
  List<String> causegroup;
  List<dynamic> tags;
  String city;
  String province;
  String type;
  bool isCampaign;
  int campaignId;
  String avatar;
  Location location;
  int graphid;
  double causeweight;
  dynamic geoDistance;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        charityId: json["charity_id"],
        groupId: json["group_id"],
        name: json["name"],
        businessNumber: json["business_number"],
        slug: json["slug"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        causes: List<String>.from(json["causes"].map((x) => x)),
        causegroup: List<String>.from(json["causegroup"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        city: json["city"],
        province: json["province"],
        type: json["type"],
        isCampaign: json["is_campaign"],
        campaignId: json["campaign_id"],
        avatar: json["avatar"],
        location: Location.fromJson(json["location"]),
        graphid: json["graphid"],
        causeweight: json["causeweight"].toDouble(),
        geoDistance: json["geo_distance"],
      );

  Map<String, dynamic> toJson() => {
        "charity_id": charityId,
        "group_id": groupId,
        "name": name,
        "business_number": businessNumber,
        "slug": slug,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "causes": List<dynamic>.from(causes.map((x) => x)),
        "causegroup": List<dynamic>.from(causegroup.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "city": city,
        "province": province,
        "type": type,
        "is_campaign": isCampaign,
        "campaign_id": campaignId,
        "avatar": avatar,
        "location": location.toJson(),
        "graphid": graphid,
        "causeweight": causeweight,
        "geo_distance": geoDistance,
      };
}

class Location {
  Location({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Meta {
  Meta({
    required this.recordCount,
    required this.pageCount,
    required this.aggregations,
  });

  int recordCount;
  int pageCount;
  Aggregations aggregations;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        recordCount: json["recordCount"],
        pageCount: json["pageCount"],
        aggregations: Aggregations.fromJson(json["aggregations"]),
      );

  Map<String, dynamic> toJson() => {
        "recordCount": recordCount,
        "pageCount": pageCount,
        "aggregations": aggregations.toJson(),
      };
}

class Aggregations {
  Aggregations({
    required this.categoriesNames,
    required this.language,
    required this.charitySize,
    required this.location,
    required this.designation,
    required this.categories,
    required this.type,
    required this.tags,
  });

  Categories categoriesNames;
  Categories language;
  Categories charitySize;
  Categories location;
  Categories designation;
  Categories categories;
  Categories type;
  Categories tags;

  factory Aggregations.fromJson(Map<String, dynamic> json) => Aggregations(
        categoriesNames: Categories.fromJson(json["categories_names"]),
        language: Categories.fromJson(json["language"]),
        charitySize: Categories.fromJson(json["charity_size"]),
        location: Categories.fromJson(json["location"]),
        designation: Categories.fromJson(json["designation"]),
        categories: Categories.fromJson(json["categories"]),
        type: Categories.fromJson(json["type"]),
        tags: Categories.fromJson(json["tags"]),
      );

  Map<String, dynamic> toJson() => {
        "categories_names": categoriesNames.toJson(),
        "language": language.toJson(),
        "charity_size": charitySize.toJson(),
        "location": location.toJson(),
        "designation": designation.toJson(),
        "categories": categories.toJson(),
        "type": type.toJson(),
        "tags": tags.toJson(),
      };
}

class Categories {
  Categories({
    required this.docCountErrorUpperBound,
    required this.sumOtherDocCount,
    required this.buckets,
  });

  int docCountErrorUpperBound;
  int sumOtherDocCount;
  List<Bucket> buckets;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        docCountErrorUpperBound: json["doc_count_error_upper_bound"],
        sumOtherDocCount: json["sum_other_doc_count"],
        buckets:
            List<Bucket>.from(json["buckets"].map((x) => Bucket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doc_count_error_upper_bound": docCountErrorUpperBound,
        "sum_other_doc_count": sumOtherDocCount,
        "buckets": List<dynamic>.from(buckets.map((x) => x.toJson())),
      };
}

class Bucket {
  Bucket({
    required this.key,
    required this.docCount,
  });

  String key;
  int docCount;

  factory Bucket.fromJson(Map<String, dynamic> json) => Bucket(
        key: json["key"],
        docCount: json["doc_count"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "doc_count": docCount,
      };
}
