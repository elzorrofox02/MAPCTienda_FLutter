import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id, name, price, image, url;
  final int qty;
  final int stock;

  CartItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.url,
    required this.stock,
    required this.qty,
  });
}

/* enum CartStatus { normal, details, cart } */

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem({required String productId, price, image, name, url, stock, qty}) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (value) => CartItem(id: value.id, name: value.name, price: value.price, qty: value.qty + 1, image: value.image, url: value.url, stock: value.stock));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: productId,
                image: image.toString(),
                name: name.toString(),
                price: price.toString(),
                url: url.toString(),
                stock: stock,
                qty: 1,
              ));
      notifyListeners();
    }
  }

  double get totalToPay {
    double total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.qty;
    });
    return total;
  }

  Future<void> removeItem({required String productId}) async {
    //void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  Future<void> clearCart() async {
    //void clearCart() {
    _items = {};
    notifyListeners();
  }

  String get text1 => "hola";

  /* CartStatus cartStatus = CartStatus.normal;

  void changeToNormal() {
    cartStatus = CartStatus.normal;
    notifyListeners();
  }

  void changeToCart() {
    cartStatus = CartStatus.cart;
    notifyListeners();
  }

  String _text1 = "Hola";

  

  Future<void> setText({required String value1}) async {
    _text1 = value1;
    notifyListeners();
  } */
}
