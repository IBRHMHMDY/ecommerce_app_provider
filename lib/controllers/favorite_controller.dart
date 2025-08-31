
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteController extends ChangeNotifier {
  final List<ProductModel> favorites = [];
  List<ProductModel> get _fav => favorites;

  
  void toggleFavorites(ProductModel product) {
    if(favorites.contains(product)){
      _fav.remove(product);
    }else{
      _fav.add(product);
    }
    notifyListeners();
  }

  /// Remove Product from Favorites List
  void removeFromFavorites(ProductModel product) {
    _fav.remove(product);
    notifyListeners();
  }
  int get favCount => _fav.length;
  
  bool isFavorite(ProductModel product) {
    final isExists = _fav.contains(product);
    return isExists;
  }

  /// الوصول للـ Provider
  static FavoriteController of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteController>(context, listen: listen);
  }
}