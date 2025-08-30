import 'package:ecommerce_app_provider/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;          // الكمية

  CartModel({
    required this.product,
    this.quantity = 1, // الكمية الافتراضية = 1
  });

  /// عشان نقدر نقارن العناصر ونستخدم indexWhere
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel && runtimeType == other.runtimeType && product.id == other.product.id;

  @override
  int get hashCode => product.id.hashCode;
}
