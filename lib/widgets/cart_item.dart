import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/widgets/checkout.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    var content;

    if (cartItems.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cart is empty shop now',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Shop Now'),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      content = Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 69),
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible (
                        key: ValueKey(cartItems[index]),
                        onDismissed: (DismissDirection direction) {

                          setState(() {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      addRemovedItem();
                                      Navigator.of(context).pop();
                                    }),
                                content: Text(
                                    '${cartItems[index].addedProduct.name} removed'),
                              ),
                            );
                            removeItem(index);
                          });

                          print('Hello');
                        },
                        background: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          color: Colors.redAccent,
                        ),
                        child: Card(
                          color: Colors.transparent,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.black38,
                                  backgroundImage: AssetImage(
                                      cartItems[index].addedProduct.image),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    cartItems[index].addedProduct.name,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '\$${cartItems[index].addedProduct.price.toString()}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '*',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            cartItems[index].quantity.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${cartItems[index].totalPrice.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              child: Checkout(),
            ),
          ),
        ],
      );
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.grey],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: content,
    );
  }
}
