class TravelExpense {
  int? id;
  String? date;
  String? amount;
  String? description;
  String? extraNote;
  String? ticketFile;
  String? createdAt;
  bool? active;
  int travel = 0;
  int expenseType = 0;

  TravelExpense({
    required this.travel,
    required this.expenseType,
    this.active,
    this.amount,
    this.createdAt,
    this.date,
    this.description,
    this.extraNote,
    this.id,
    this.ticketFile,
  });

  factory TravelExpense.fromJson(Map<String, dynamic> json) {
    return TravelExpense(
      travel: json['travel'],
      expenseType: json['expenseType'],
      active: json['active'],
      amount: json['amount'],
      createdAt: json['createdAt'],
      date: json['date'],
      description: json['description'],
      extraNote: json['extraNote'],
      id: json['id'],
      ticketFile: json['ticketFile'],
    );
  }
}
