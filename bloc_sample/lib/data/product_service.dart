import 'package:bloc_sample/model/product.dart';

// Fake Data
class ProductService {
  static List<Product> products = List<Product>();

  static ProductService _singleton = ProductService._internal();

  factory ProductService() => _singleton;

  ProductService._internal();

  static List<Product> getAll() {
    products.add(Product(1, "Apple Laptop", 15));
    products.add(Product(2, "HP Laptop", 14));
    products.add(Product(3, "Acer Laptop", 13));
    products.add(Product(4, "Lenova Laptop", 12));
    products.add(Product(5, "Huawei Laptop", 11));
    products.add(Product(6, "Asus Laptop", 10));

    return products;
  }
}
