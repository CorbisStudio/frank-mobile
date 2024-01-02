class TravelItinerary {
  int? id;
  String? prjName;
  String? country;
  String? city;
  String? address;
  String? fromDate;
  String? toDate;
  String? accommodation;
  bool? mobility;
  String? corbisterPreferences;
  String? ticketFileUrl;
  String? reservationFileUrl;
  bool? active;
  int travel = 0;

  TravelItinerary({
    this.accommodation,
    this.active,
    this.address,
    this.city,
    this.corbisterPreferences,
    this.country,
    this.fromDate,
    this.id,
    this.mobility,
    this.prjName,
    this.reservationFileUrl,
    this.ticketFileUrl,
    this.toDate,
    required this.travel,
  });

  factory TravelItinerary.fromJson(Map<String, dynamic> json) {
    return TravelItinerary(
      travel: json['travel'],
      accommodation: json['accommodation'],
      active: json['active'],
      address: json['address'],
      city: json['city'],
      corbisterPreferences: json['corbisterPreferences'],
      country: json['country'],
      fromDate: json['fromDate'],
      id: json['id'],
      mobility: json['mobility'],
      prjName: json['prjName'],
      reservationFileUrl: json['reservationFileUrl'],
      ticketFileUrl: json['ticketFileUrl'],
      toDate: json['toDate'],
    );
  }
}
