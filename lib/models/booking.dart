import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.id,
    required this.platformId,
    this.platformName,
    required this.startTime,
    required this.endTime,
    this.expired,
    this.createdAt,
    this.updatedAt,
    this.bookingId,
  });

  String? id;
  String platformId;
  String? platformName;
  DateTime startTime;
  DateTime endTime;
  bool? expired;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? bookingId;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["_id"],
        platformId: json["platformID"],
        platformName: json["platformName"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        expired: json["expired"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bookingId: json["bookingID"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "platformID": platformId,
        "platformName": platformName,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "expired": expired,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "bookingID": bookingId,
      };
}
