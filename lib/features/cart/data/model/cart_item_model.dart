class CartItemModel {
  final String id;
  final String productId;
  final String name;
  final num price;
  final String image;
  final int cartQuantity;
  final int availableQuantity;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.cartQuantity,
    required this.availableQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    final product = data['products'];

    return CartItemModel(
      id: data['id'].toString(),
      productId: product['id'].toString(),
      name: product['name'] as String,
      price: product['price'] as num,
      image: product['image'] as String,
      cartQuantity: (data['quantity'] as num).toInt(),
      availableQuantity: (product['quantity'] as num).toInt(),
    );
  }

  CartItemModel copyWith({int? cartQuantity}) {
    return CartItemModel(
      id: id,
      productId: productId,
      name: name,
      price: price,
      image: image,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      availableQuantity: availableQuantity,
    );
  }
}
