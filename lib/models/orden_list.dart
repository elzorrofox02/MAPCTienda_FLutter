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

OrdenList OrdenListDataFromJson(String str) => OrdenList.fromJson(json.decode(str));

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
  //dynamic? items;
  List<Product>? items;
  //Object? items;

  OrdenList({this.id, this.status, this.deliveryPrice, this.totalPrice, this.totalQuantity, this.create, this.statusDetail, this.plataform, this.target, this.operationType, this.paymentMethodId, this.paymentTypeId, this.statusPay, this.statusDetailPay, this.currencyId, this.cardLastDigits, this.cardname, this.items

      //this.items
      });

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
        'items': List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

List<OrdenList> demoOrdenListlist = [
  OrdenList(
    id: "as456sa456asasadgdag23111112312", status: "bolsa", deliveryPrice: "0", totalPrice: "299", totalQuantity: "totalQuantity", create: "create", statusDetail: "statusDetail", plataform: "plataform", target: "target", operationType: "operation_type", paymentMethodId: "payment_method_id", paymentTypeId: "payment_type_id", statusPay: "statusPay", statusDetailPay: "status_detail", currencyId: "currency_id", cardLastDigits: "card_last_four_digits", cardname: "cardname",
    // items: {
    //   {
    //     "5e9e5ec7d020010b9004128f": {
    //       "item": {
    //         "categoria": {"name": "Periféricos"},
    //         "CategoryFamily": {"name": "Monitores"},
    //         "image": {"fotos": [], "path": "https://thumb.pccomponentes.com/w-530-530/articles/20/209952/00.jpg"},
    //         "promotion": {"date": null, "descuento": null},
    //         "rating": 0,
    //         "arraySearch": [],
    //         "view": 0,
    //         "shell": 0,
    //         "envio": "Solo Venezuela",
    //         "disponibilidad": "Inmediata",
    //         "recomendation": [],
    //         "_id": "5e9e5ec7d020010b9004128f",
    //         "name": "Asus BE229QLB Monitor LED 21.5\" Negro",
    //         "price": 153.02,
    //         "cantidad": 10,
    //         "type": "Periféricos",
    //         "marca": "Asus",
    //         "created_at": "2020-04-21T02:47:35.127Z",
    //         "updated_at": "2020-04-21T02:47:35.127Z",
    //         "slug": "asus-be229qlb-monitor-led-215-negro-gZnk4rKvA-",
    //         "__v": 0
    //       },
    //       "totalQty": 9,
    //       "totalPrice": 1377.18
    //     },
    //     "5e9e5ec7d0200adgad10b9004128f": {
    //       "item": {
    //         "categoria": {"name": "Periféricos"},
    //         "CategoryFamily": {"name": "Monitores"},
    //         "image": {"fotos": [], "path": "https://thumb.pccomponentes.com/w-530-530/articles/20/209952/00.jpg"},
    //         "promotion": {"date": null, "descuento": null},
    //         "rating": 0,
    //         "arraySearch": [],
    //         "view": 0,
    //         "shell": 0,
    //         "envio": "Solo Venezuela",
    //         "disponibilidad": "Inmediata",
    //         "recomendation": [],
    //         "_id": "5e9e5ec7d020010b9004128f",
    //         "name": "Asus BE22daggda9QLB Monitgadagdgador LED 21.5\" Negro",
    //         "price": 153.02,
    //         "cantidad": 10,
    //         "type": "Periféricos",
    //         "marca": "Asus",
    //         "created_at": "2020-04-21T02:47:35.127Z",
    //         "updated_at": "2020-04-21T02:47:35.127Z",
    //         "slug": "asus-be229qlb-monitor-led-215-negro-gZnk4rKvA-",
    //         "__v": 0
    //       },
    //       "totalQty": 9,
    //       "totalPrice": 1377.18
    //     }
    //   }
    // }
  ),
  OrdenList(id: "as456sa456asasadgdag23111112312", status: "processing_payment", deliveryPrice: "0", totalPrice: "299", totalQuantity: "totalQuantity", create: "create", statusDetail: "statusDetail", plataform: "plataform", target: "target", operationType: "operation_type", paymentMethodId: "payment_method_id", paymentTypeId: "payment_type_id", statusPay: "statusPay", statusDetailPay: "status_detail", currencyId: "currency_id", cardLastDigits: "card_last_four_digits", cardname: "cardname"),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "acreddit_payment",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "packet",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "shipped",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "finish",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "pendient_payment",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "rejected_payment",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
  OrdenList(
    id: "as456sa456asasadgdag23111112312",
    status: "cancel",
    deliveryPrice: "0",
    totalPrice: "299",
    totalQuantity: "totalQuantity",
    create: "create",
    statusDetail: "statusDetail",
    plataform: "plataform",
    target: "target",
    operationType: "operation_type",
    paymentMethodId: "payment_method_id",
    paymentTypeId: "payment_type_id",
    statusPay: "statusPay",
    statusDetailPay: "status_detail",
    currencyId: "currency_id",
    cardLastDigits: "card_last_four_digits",
    cardname: "cardname",
  ),
];
