import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final dynamic product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          color: const Color.fromARGB(
              255, 255, 255, 255), // Add margin to the card
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(product['image']),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  product['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                //SizedBox(height: 8),
                //Text('Description: ${product['description']}'),
                const SizedBox(height: 8),
                Text('Price: \$${product['price']}'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Request has beeen sent to the Vendor'),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_bag),
                      label: Text('Buy Now'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product added to the cart'),
                          ),
                        );
                      },
                      label: const Text('Add to Cart'),
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
