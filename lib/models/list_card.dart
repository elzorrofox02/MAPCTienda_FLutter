class ListCard {
  String? id, number, name, month, year, cvv, color, brand;

  ListCard({this.id, this.number, this.name, this.month, this.year, this.cvv, this.color, this.brand});

  factory ListCard.fromJson(Map<String, dynamic> json) => ListCard(id: json["id"], number: json["number"], name: json["name"], month: json["month"], year: json["year"], cvv: json["cvv"], color: json["color"], brand: json["brand"]);

  Map<String, dynamic> toJson() => {'id': id, 'number': number, 'name': name, 'month': month, 'year': year, 'cvv': cvv, 'color': color};
}

List<ListCard> demoListCard = [
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "visa"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "visa"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "mastercard"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "verve"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "discover"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "american_express"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "dinners_club"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "jcb"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "others"),
  ListCard(id: "as456sa456asasadgdag23111112312", number: "4445", name: "Smith Salii", month: "12", year: "26", cvv: "***", color: "red", brand: "invalid"),
];
