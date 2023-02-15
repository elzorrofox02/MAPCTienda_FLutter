import 'dart:convert';
import './product.dart';

// class ProductData {
//   ProductData({
//     required this.totalItems,
//     required this.totalPages,
//     required this.data,
//   });

//   int totalItems;
//   int totalPages;
//   List<Product> data;

//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         totalItems: json["totalResult"]["totalCount"][0]["count"],
//         totalPages: json["pages"],
//         data: List<Product>.from(json["items"].map((x) => Product.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "totalItems": totalItems,
//         "totalPages": totalPages,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

OrdenList ordenListDataFromJson(String str) => OrdenList.fromJson(json.decode(str));

class OrdenCount {
  num? acreddit, pendient, processing, rejected, cancel, bag, packet, shipped, finish, total, pages, totalcancel;

  OrdenCount({this.acreddit, this.pendient, this.processing, this.rejected, this.cancel, this.bag, this.packet, this.shipped, this.finish, this.total, this.pages, this.totalcancel});

  factory OrdenCount.fromJson(Map<String, dynamic> json) => OrdenCount(
        acreddit: json["count"]["acreddit"], //1
        pendient: json["count"]["pendient"], //3
        processing: json["count"]["processing"], //4
        rejected: json["count"]["rejected"],
        cancel: json["count"]["cancel"],
        totalcancel: json["count"]["rejected"] + json["count"]["cancel"], //5
        bag: json["count"]["bag"], //6
        packet: json["count"]["packet"], //7
        shipped: json["count"]["shipped"], //8
        finish: json["count"]["finish"], //9
        total: json["count"]["total"], //total
        pages: json["count"]["pages"], //pages
      );
}

class OrdenList {
  String? id, status, totalPrice, totalQuantity, create, statusDetail, deliveryPrice;
  String? plataform, target;
  String? operationType, paymentMethodId, paymentTypeId, statusPay, statusDetailPay, currencyId;
  String? cardLastDigits, cardname;

  List<Product>? items;
  Envio? envio;
  //Object? items;

  OrdenList({this.id, this.status, this.deliveryPrice, this.totalPrice, this.totalQuantity, this.create, this.statusDetail, this.plataform, this.target, this.operationType, this.paymentMethodId, this.paymentTypeId, this.statusPay, this.statusDetailPay, this.currencyId, this.cardLastDigits, this.cardname, this.items, this.envio});

  //factory OrdenList.fromJson(Map<String, dynamic> json) => OrdenList(
  factory OrdenList.fromJson(json) => OrdenList(
        id: json["_id"],
        status: json["status"],
        deliveryPrice: json["DeliveryPrice"].toString(),
        totalPrice: json["totalPrice"].toString(),
        totalQuantity: json["totalQuantity"].toString(),
        create: json["created_at"],
        statusDetail: json["statusDetail"],
        plataform: json["payment"]?["plataform"]?.toString(),
        target: json["payment"]?["target"],
        operationType: json["detailPayment"]?["operation_type"],
        paymentMethodId: json["detailPayment"]?["payment_method_id"],
        paymentTypeId: json["detailPayment"]?["payment_type_id"],
        statusPay: json["detailPayment"]?["status"],
        statusDetailPay: json["detailPayment"]?["status_detail"],
        currencyId: json["detailPayment"]?["currency_id"],
        cardLastDigits: json["detailPayment"]?["card"]?["last_four_digits"],
        cardname: json["detailPayment"]?["card"]?["cardholder"]?["name"],
        envio: Envio.fromJson(json['envio']),
        //items: (json["cart"] as Map).values.toList(),

        items: List<Product>.from(json["cart"].values.toList().map((x) => Product.fromJsonItem(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'DeliveryPrice': deliveryPrice,
        'totalPrice': totalPrice,
        'totalQuantity': totalQuantity,
        'create': create,
        'statusDetail': statusDetail,
        'plataform': plataform,
        'target': target,
        'operationType': operationType,
        'payment_method_id': paymentMethodId,
        'paymentMethodId': paymentTypeId,
        'statusPay': statusPay,
        'statusDetailPay': statusDetailPay,
        'currencyId': currencyId,
        'cardLastDigits': cardLastDigits,
        'cardname': cardname,
        'envio': envio,
        'items': List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Envio {
  String? plataform;
  String? dataName, datalastname, dataDocType, dataDocNumber, dataPhone, dataEmail, dataConctaperson, dataEmpresa, dataInstruccion, dataInstructionother;
  Metdirection? metdirection;
  Province? province;
  Express? express;
  Envio({this.plataform, this.dataName, this.datalastname, this.dataDocType, this.dataDocNumber, this.dataPhone, this.dataEmail, this.dataConctaperson, this.dataEmpresa, this.dataInstruccion, this.dataInstructionother, this.metdirection, this.province, this.express});

  factory Envio.fromJson(json) => Envio(
        plataform: json["plataform"],
        dataName: json["result"]["data"]["name"],
        datalastname: json["result"]["data"]["lastname"],
        dataDocType: json["result"]["data"]["docType"],
        dataDocNumber: json["result"]["data"]["docNumber"],
        dataPhone: json["result"]["data"]["phone"],
        dataEmail: json["result"]["data"]["Email"],
        dataConctaperson: json["result"]["data"]["conctaperson"],
        dataEmpresa: json["result"]["data"]["empresa"],
        dataInstruccion: json["result"]["data"]["instruccion"],
        dataInstructionother: json["result"]["data"]["instructionother"],
        metdirection: (json["plataform"] == "province" || json["plataform"] == "express" || json["plataform"] == "express_programic") ? Metdirection.fromJson(json["result"]["metdirection"]) : null,
        province: json["plataform"] == "province" ? Province.fromJson(json["result"]["province"]) : null,
        express: json["plataform"] == "express" ? Express.fromJson(json["result"]["lanlon"]) : null,
      );
  // Map<String, dynamic> toJson() => {
  //       'plataform': plataform,
  //     };
}

class Metdirection {
  String? direction, number, piso, reference;
  Metdirection({this.direction, this.number, this.piso, this.reference});
  factory Metdirection.fromJson(json) => Metdirection(direction: json?["direction"], number: json?["number"], piso: json?["piso"], reference: json?["reference"]);
}

class Province {
  String? country, city, province, distrit;
  Province({this.country, this.city, this.province, this.distrit});
  factory Province.fromJson(json) => Province(country: json?["country"], city: json?["city"], province: json?["province"], distrit: json?["distrit"]);
}

class Express {
  String? diretionmaps, lat, long, lanlong, pack;
  Express({this.diretionmaps, this.lat, this.long, this.lanlong, this.pack});
  factory Express.fromJson(json) => Express(diretionmaps: json?["diretionmaps"], lat: json?["lat"].toString(), long: json?["long"].toString(), lanlong: json?["lanlong"], pack: json?["pack"].toString());
}
