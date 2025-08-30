import 'package:ecommerce_app_provider/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier {
  final List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;

  double _discount = 0; // قيمة الخصم
  double get discount => _discount;
  
  /// Add To Cart Button
  void btnAddToCart(CartModel cartItem) {
    final index = _cart.indexWhere((item) => item.id == cartItem.id);
    if (index != -1) {
      // if Product Exists > Increment Amount
      _cart[index].quantity += cartItem.quantity;
    } else {
      // if Not Exists > add to Array
      _cart.add(cartItem);
    }
    notifyListeners();
  }

  /// Increment Amounts
  void plusAmount(int index,List<CartModel> cartItem) {
     _cart[index].quantity ++;
    notifyListeners();
  }

  /// Decrement Amounts
  void minusAmount(int index, List<CartModel> cartItem) {
    if (_cart[index].quantity > 1) {
     _cart[index].quantity --;
    }
    notifyListeners();
  }

  /// Remove Product from Cart
  void removeFromCart(int index) {
    _cart.removeAt(index);
    
    notifyListeners();
  }
  /// Total Cart
  double get total => _cart.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
  /// total with discount
  double get finalTotal => total - _discount;

  void applyCoupon(String code) {
    /// Ex: Sava10 = Discount 10
    if (code == "SAVE10") {
      _discount = 10;
    } else {
      _discount = 0;
    }
    notifyListeners();
  }
  /// Get Amount per Product
  int getQuantity(int id) {
  final index = _cart.indexWhere((item) => item.id == id);
  if (index != -1) {
    return _cart[index].quantity;
  }
  return 1;
}

  int get cartCount => _cart.length;
  
  /// الوصول للـ Provider
  static CartController of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartController>(context, listen: listen);
  }
}
