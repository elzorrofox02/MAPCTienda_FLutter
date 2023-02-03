import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hellowork/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Mcart> _items = {};

  Map<String, Mcart> get items {
    return {..._items};
  }

  void addItem({required String productId, price, image, name, url, stock, qty}) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.qty < stock) {
        _items.update(productId, (value) => Mcart(id: value.id, name: value.name, price: value.price, qty: value.qty + 1, image: value.image, url: value.url, stock: value.stock));
        notifyListeners();
      }
    } else {
      if (stock! > qty) {
        _items.putIfAbsent(
            productId,
            () => Mcart(
                  id: productId,
                  image: image.toString(),
                  name: name.toString(),
                  price: price.toString(),
                  url: url.toString(),
                  stock: stock,
                  qty: qty,
                ));
        notifyListeners();
      }
    }
  }

  Future<void> removeItem({required String productId}) async {
    _items.remove(productId);
    notifyListeners();
  }

  Future<void> clearCart() async {
    _items = {};
    notifyListeners();
  }

  String get totalToPay {
    double total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.qty;
    });
    return total.toString();
  }

  String get totalItems => _items.length.toString();
}
