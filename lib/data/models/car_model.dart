import 'dart:convert';

CarModelOne carModelOneFromJson(String str) => CarModelOne.fromJson(json.decode(str));


class CarModelOne {
  CarModelOne({
    required this.data,
  });

  List<Datum> data;

  factory CarModelOne.fromJson(Map<String, dynamic> json) => CarModelOne(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.carModel,
    this.averagePrice,
    this.logo,
    this.establishedYear,
  });

  int? id;
  String? carModel;
  int? averagePrice;
  String? logo;
  int? establishedYear;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    carModel: json["car_model"],
    averagePrice: json["average_price"],
    logo: json["logo"],
    establishedYear: json["established_year"],
  );

}
