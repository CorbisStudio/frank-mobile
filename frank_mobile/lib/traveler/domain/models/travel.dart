enum TypeTrip { A, B, C }

enum Currency { A, B, C }

class Travel {
  int? id;
  String? proyectId;
  TypeTrip typeTrip = TypeTrip.A;
  Currency currency = Currency.A;
  String? budget;
  String? available;
  String? fromDate;
  String? toDate;
  bool? active;
  int frankId = 0;

  Travel({
    this.active,
    this.available,
    this.budget,
    required this.currency,
    required this.frankId,
    this.fromDate,
    this.id,
    this.proyectId,
    this.toDate,
    required this.typeTrip,
  });

  factory Travel.fromJson(Map<String, dynamic> json) {
    return Travel(
      available: json['available'],
      budget: json['budget'],
      currency: json['currency'],
      frankId: json['frankId'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      id: json['id'],
      proyectId: json['proyectId'],
      typeTrip: json['typeTrip'],
      active: json['token']! as bool,
    );
  }


}

