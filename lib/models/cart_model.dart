class CartModel {
  final int id;       // معرف فريد للمنتج
  final String title;    // اسم المنتج
  final String category; // الفئة (اختياري)
  final String image;    // صورة المنتج
  final double price;    // السعر
  int quantity;          // الكمية

  CartModel({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.price,
    this.quantity = 1, // الكمية الافتراضية = 1
  });

  /// عشان نقدر نقارن العناصر ونستخدم indexWhere
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
