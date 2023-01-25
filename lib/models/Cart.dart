class mCart {
  final String id, name, price, image, url;
  final int qty, stock;

  mCart({required this.id, required this.name, required this.price, required this.qty, required this.url, required this.image, required this.stock});
  mCart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        name = data['name'],
        price = data['price'],
        qty = data['quantity'],
        stock = data['stock'],
        url = data['url'],
        image = data['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': qty,
      'stock': stock,
      'url': url,
      'image': image,
    };
  }
}
