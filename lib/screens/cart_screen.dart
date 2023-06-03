import 'package:e_commerce_app/widgets/cart_item.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Shop More',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
        elevation: 0,
        title: Text('Cart'),
      ),
      body: CartItems(),
    );
  }
}
