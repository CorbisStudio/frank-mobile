class Traveler {
  int? id;
  late String code;
  late String firstName;
  late String lastName;
  bool? active;
  String? startDate;
  String? endDate;
  String? formerCode;
  String? createDate;
  String? updateDate;
  int? frankId;
  bool? deleted;
  String? frankProfilePictureUrl;
  String? companyHq;
  String? country;
  String? idCard;
  String? idExpirationDate;
  String? idFileUrl;
  String? idType;
  String? passportNumber;
  String? passportFileUrl;
  String? passportExpirationDate;
  String? usaVisaNumber;
  String? usaVisaFileUrl;
  String? usaVisaExpirationDate;
  String? europeEstaNumber;
  String? europeEstafileUrl;
  String? europeEstaExpirationDate;
  String? travellerAssistanceNumber;
  String? travellerAssistanceFileUrl;
  String? familyGroup;
  String? workStatus;
  String? birthday;
  String? gender;
  int? position;
  int? positionLevel;
  int? reporter;
  int? user;
  int? author;
  int? updater;

  Traveler({
    this.id,
    required this.code,
    required this.firstName,
    required this.lastName,
    this.active,
    this.startDate,
    this.endDate,
    this.formerCode,
    this.createDate,
    this.updateDate,
    this.frankId,
    this.deleted,
    this.frankProfilePictureUrl,
    this.companyHq,
    this.country,
    this.idCard,
    this.idExpirationDate,
    this.idFileUrl,
    this.idType,
    this.passportNumber,
    this.passportFileUrl,
    this.passportExpirationDate,
    this.usaVisaNumber,
    this.usaVisaFileUrl,
    this.usaVisaExpirationDate,
    this.europeEstaNumber,
    this.europeEstafileUrl,
    this.europeEstaExpirationDate,
    this.travellerAssistanceNumber,
    this.travellerAssistanceFileUrl,
    this.familyGroup,
    this.workStatus,
    this.birthday,
    this.gender,
    this.position,
    this.positionLevel,
    this.reporter,
    this.user,
    this.author,
    this.updater,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) {
    return Traveler(
      code: json['code'],
      id: json['id'],
      active: json['active'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      formerCode: json['formerCode'],
      createDate: json['createDate'],
      updateDate: json['updateDate'],
      frankId: json['frankId'],
      deleted: json['deleted'],
      frankProfilePictureUrl: json['frankProfilePictureUrl'],
      companyHq: json['companyHq'],
      country: json['country'],
      idCard: json['idCard'],
      idExpirationDate: json['idExpirationDate'],
      idFileUrl: json['idFileUrl'],
      idType: json['idType'],
      passportNumber: json['passportNumber'],
      passportFileUrl: json['passportFileUrl'],
      passportExpirationDate: json['passportExpirationDate'],
      usaVisaNumber: json['usaVisaNumber'],
      usaVisaFileUrl: json['usaVisaFileUrl'],
      usaVisaExpirationDate: json['usaVisaExpirationDate'],
      europeEstaNumber: json['europeEstaNumber'],
      europeEstafileUrl: json['europeEstafileUrl'],
      europeEstaExpirationDate: json['europeEstaExpirationDate'],
      travellerAssistanceNumber: json['travellerAssistanceNumber'],
      travellerAssistanceFileUrl: json['travellerAssistanceFileUrl'],
      familyGroup: json['familyGroup'],
      workStatus: json['workStatus'],
      birthday: json['birthday'],
      gender: json['gender'],
      position: json['position'],
      positionLevel: json['positionLevel'],
      reporter: json['reporter'],
      user: json['user'],
      author: json['author'],
      updater: json['updater'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
