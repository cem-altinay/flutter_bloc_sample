import 'package:bloc_sample/model/cart.dart';

class CartService {
  static List<Cart> carts = new List<Cart>();

  static CartService _singleton = CartService._internal();

  CartService._internal();

  factory CartService() => _singleton;

  static void addToCart(Cart item) {
    carts.add(item);
  }

  static void removeFromCart(Cart item) {
    carts.remove(item);
  }

  static List<Cart> getCarts() {
    return carts;
  }
}
