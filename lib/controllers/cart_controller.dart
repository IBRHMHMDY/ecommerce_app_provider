
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier{
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;

  void toggleCart(ProductModel product){
    if(_cart.contains(product)){
      for(ProductModel element in _cart){
        element.quantity++;
      }
    }else{
      _cart.add(product);
    }
    notifyListeners();
  }

  static CartController of(
    BuildContext context, {
      bool listen = true,
    }
  ) {
    return Provider.of<CartController>(context,listen: listen);
  }
}