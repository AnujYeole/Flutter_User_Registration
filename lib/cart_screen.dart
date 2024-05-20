import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cart.cartItemCount})'),
      ),
      body: ListView.builder(
        itemCount: cart.cartItemCount,
        itemBuilder: (context, index) {
          var item = cart.cartItems[index];
          return ListTile(
            leading: Image.network(item['image']),
            title: Text(item['title']),
            subtitle: Text('\$${item['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cart.removeFromCart(item);
              },
            ),
          );
        },
      ),
    );
  }
}
