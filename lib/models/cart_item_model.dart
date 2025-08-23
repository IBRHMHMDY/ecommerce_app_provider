class CartItem {
  final String id;           // معرف المنتج داخل السلة
  final String productId;    // معرف المنتج الأصلي
  final String name;         // اسم المنتج
  final String image;        // صورة المنتج
  final double price;        // سعر الوحدة
  final int quantity;        // الكمية
  final String category;     // الفئة

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
  });

  // ✅ نسخ العنصر مع تحديث قيم معينة (مفيد عند زيادة الكمية)
  CartItem copyWith({
    String? id,
    String? productId,
    String? name,
    String? image,
    double? price,
    int? quantity,
    String? category,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
    );
  }

  // ✅ تحويل من JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      category: json['category'],
    );
  }

  // ✅ تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'category': category,
    };
  }

  // ✅ حساب السعر الكلي للعنصر (السعر × الكمية)
  double get totalPrice => price * quantity;
}
