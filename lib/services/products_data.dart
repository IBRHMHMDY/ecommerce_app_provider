import '../models/product_model.dart';

class ProductsData {
  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        id: 1,
        name: "Nike Air Max 270",
        category: "Shoes",
        description:
            "The Nike Air Max 270 delivers visible cushioning and all-day comfort with a modern look.",
        price: 150.00,
        imageUrl:
            "https://i.ibb.co/7y9Q2Vj/nike-air-max-270.png", // صورة شبشب نايك
        rating: 4.5,
      ),
      ProductModel(
        id: 2,
        name: "Adidas Ultraboost 22",
        category: "Shoes",
        description:
            "Adidas Ultraboost 22 offers energy return with a sleek design for daily running and casual wear.",
        price: 180.00,
        imageUrl:
            "https://i.ibb.co/3cvMPrw/adidas-ultraboost-22.png", // صورة اديداس
        rating: 4.8,
      ),
      ProductModel(
        id: 3,
        name: "Puma RS-X",
        category: "Shoes",
        description:
            "Puma RS-X reinvents the style with bold colors, retro vibes, and extreme comfort.",
        price: 120.00,
        imageUrl:
            "https://i.ibb.co/9bvFF4q/puma-rsx.png", // صورة بوما
        rating: 4.3,
      ),
    ];
  }
}
