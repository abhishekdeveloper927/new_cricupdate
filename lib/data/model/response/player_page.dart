// To parse this JSON data, do
//
//     final playerPage = playerPageFromJson(jsonString);

import 'dart:convert';

PlayerPage playerPageFromJson(String str) =>
    PlayerPage.fromJson(json.decode(str));

String playerPageToJson(PlayerPage data) => json.encode(data.toJson());

class PlayerPage {
  String? status;
  Data? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  PlayerPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory PlayerPage.fromJson(Map<String, dynamic> json) => PlayerPage(
        status: json["status"],
        response:
            json["response"] == null ? null : Data.fromJson(json["response"]),
        etag: json["etag"],
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response?.toJson(),
        "etag": etag,
        "modified": modified?.toIso8601String(),
        "datetime": datetime?.toIso8601String(),
        "api_version": apiVersion,
      };
}

class Data {
  List<PlayerModel>? items;
  String? totalItems;
  int? totalPages;

  Data({
    this.items,
    this.totalItems,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<PlayerModel>.from(
                json["items"]!.map((x) => PlayerModel.fromJson(x))),
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "total_items": totalItems,
        "total_pages": totalPages,
      };
}

class PlayerModel {
  int? pid;
  String? title;
  String? shortName;
  String? firstName;
  String? lastName;
  String? middleName;
  String? birthdate;
  String? birthplace;
  String? country;
  String? logoUrl;
  String? playingRole;
  String? battingStyle;
  String? bowlingStyle;
  String? fieldingPosition;
  int? recentMatch;
  int? recentAppearance;
  double? fantasyPlayerRating;
  String? altName;
  String? facebookProfile;
  String? twitterProfile;
  String? instagramProfile;
  String? debutData;
  String? thumbUrl;
  String? nationality;

  PlayerModel({
    this.pid,
    this.title,
    this.shortName,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthdate,
    this.birthplace,
    this.country,
    this.logoUrl,
    this.playingRole,
    this.battingStyle,
    this.bowlingStyle,
    this.fieldingPosition,
    this.recentMatch,
    this.recentAppearance,
    this.fantasyPlayerRating,
    this.altName,
    this.facebookProfile,
    this.twitterProfile,
    this.instagramProfile,
    this.debutData,
    this.thumbUrl,
    this.nationality,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        pid: json["pid"],
        title: json["title"],
        shortName: json["short_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        birthdate: json["birthdate"],
        birthplace: json["birthplace"],
        country: json["country"],
        logoUrl: json["logo_url"],
        playingRole: json["playing_role"],
        battingStyle: json["batting_style"],
        bowlingStyle: json["bowling_style"],
        fieldingPosition: json["fielding_position"],
        recentMatch: json["recent_match"],
        recentAppearance: json["recent_appearance"],
        fantasyPlayerRating: json["fantasy_player_rating"]?.toDouble(),
        altName: json["alt_name"],
        facebookProfile: json["facebook_profile"],
        twitterProfile: json["twitter_profile"],
        instagramProfile: json["instagram_profile"],
        debutData: json["debut_data"],
        thumbUrl: json["thumb_url"],
        nationality: json["nationality"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "title": title,
        "short_name": shortName,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "birthdate": birthdate,
        "birthplace": birthplace,
        "country": country,
        "logo_url": logoUrl,
        "playing_role": playingRole,
        "batting_style": battingStyle,
        "bowling_style": bowlingStyle,
        "fielding_position": fieldingPosition,
        "recent_match": recentMatch,
        "recent_appearance": recentAppearance,
        "fantasy_player_rating": fantasyPlayerRating,
        "alt_name": altName,
        "facebook_profile": facebookProfile,
        "twitter_profile": twitterProfile,
        "instagram_profile": instagramProfile,
        "debut_data": debutData,
        "thumb_url": thumbUrl,
        "nationality": nationality,
      };
}
