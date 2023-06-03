import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/cart.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25,bottom: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Checkout'),
            style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(Colors.orangeAccent),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            '\$${getSum().toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
