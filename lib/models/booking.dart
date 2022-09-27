// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

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
    this.createdAt,
    this.amount,
    this.bookingId,
  });

  String? id;
  String platformId;
  String? platformName;
  DateTime startTime;
  DateTime endTime;
  DateTime? createdAt;
  int? amount;
  String? bookingId;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["_id"],
        platformId: json["platformID"],
        platformName: json["platformName"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        amount: json["amount"],
        bookingId: json["bookingID"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "platformID": platformId,
        "platformName": platformName,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "amount": amount,
        "bookingID": bookingId,
      };
}
