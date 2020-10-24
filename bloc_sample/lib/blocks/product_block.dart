import 'dart:async';

import 'package:bloc_sample/data/product_service.dart';
import 'package:bloc_sample/model/product.dart';

class ProductBlock {
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Product> getProducts() {
    return ProductService.getAll();
  }
}

final productBlock = ProductBlock();
