import 'dart:convert';

List<AdressListCard> userModelFromJson(String str) => List<AdressListCard>.from(json.decode(str).map((x) => AdressListCard.fromJson(x)));

String userModelToJson(List<AdressListCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdressListCard {
  String? id, numero, active, country, estate, city, muni, direction, personame, personamephone, empresa;

  AdressListCard({
    this.id,
    this.active,
    this.country,
    this.estate,
    this.city,
    this.muni,
    this.numero,
    this.direction,
    this.personame,
    this.personamephone,
    this.empresa,
    //this.optionSearch = "",
  });

  factory AdressListCard.fromJson(Map<String, dynamic> json) => AdressListCard(
        id: json["id"],
        active: json["active"],
        country: json["country"],
        estate: json["estate"],
        city: json["city"],
        muni: json["muni"],
        numero: json["numero"],
        direction: json["direction"],
        personame: json["personame"],
        personamephone: json["personamephone"],
        empresa: json["empresa"],
      );

  Map<String, dynamic> toJson() => {'id': id, 'active': active, 'country': country, 'estate': estate, 'city': city, 'muni': muni, 'numero': numero, 'direction': direction, 'personame': personame, 'personamephone': personamephone, 'empresa': empresa};
}

List<AdressListCard> demoAdresslist = [
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "usa", estate: "florida", city: "miami", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465", empresa: "holalxlxlxlx"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
  AdressListCard(id: "as456sa456asasadgdag23111112312", numero: "4545445", active: "true", country: "vene", estate: "carabobo", city: "valencia", muni: "beach", direction: "casa al lado de la cruz rojo", personame: "Jr", personamephone: "465465465"),
];
