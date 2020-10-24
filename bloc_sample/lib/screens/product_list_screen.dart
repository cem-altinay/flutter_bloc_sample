import 'package:bloc_sample/blocks/cart_block.dart';
import 'package:bloc_sample/blocks/product_block.dart';
import 'package:bloc_sample/model/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alış Veriş"), actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
        ),
      ]),
      body: buildProductList(),
    );
  }

  Widget buildProductList() {
    return StreamBuilder(
        initialData: productBlock.getProducts(),
        stream: productBlock.getStream,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? buildProductListItems(snapshot)
              : Center(
                  child: Text("Veri yok"),
                );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(
              list[index].price.toString(),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartBlock.addToCart(Cart(list[index], 1));
              },
            ),
          );
        });
  }
}
