import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String searchItem;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'FutterBay',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      alignment: Alignment.topCenter,
                      content: Form(
                        child: TextFormField(
                          onChanged: (value){
                            searchItem=value;
                          },
                          decoration: InputDecoration(
                            labelText: 'search',
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => CartScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (500 / 675),
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ProductDetails(
                          products: products[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: products[index].color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 30,
                      right: 10,
                      bottom: 5,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Hero(
                            tag: products[index].id,
                            child: Image.asset(
                              products[index].image,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          products[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '\$ ${products[index].price.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
