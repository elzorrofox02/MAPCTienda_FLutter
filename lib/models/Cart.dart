import 'Product.dart';

class mCart {
  /* final Product product;
  final int numOfItem; */
  late final int? id;
  final String? name;
  final int? price;
  final int? stock;
  final int? quantity;
  final String? url;
  final String? image;

  mCart({required this.id, required this.name, required this.price, required this.quantity, required this.url, required this.image, required this.stock});
  mCart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        name = data['name'],
        price = data['price'],
        quantity = data['quantity'],
        stock = data['stock'],
        url = data['url'],
        image = data['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': name,
      'productPrice': price,
      'quantity': quantity,
      'stock': stock,
      'url': url,
      'image': image,
    };
  }
}

// Demo data for our cart

/* List<mCart> demoCarts = [
  mCart(product: demo_product[0], numOfItem: 2),
  mCart(product: demo_product[1], numOfItem: 1),
  mCart(product: demo_product[2], numOfItem: 1),
];
 */