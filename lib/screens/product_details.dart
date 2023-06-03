import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/widgets/color_select.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.products});
  final Products products;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool addLike = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: widget.products.color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.products.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              // height: 368,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    // margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 110,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ColorSelector(
                                          inputColor: Colors.blueAccent),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ColorSelector(inputColor: Colors.orange),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ColorSelector(inputColor: Colors.grey),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.products.size.toString()} cm',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            widget.products.description,
                            style:
                                TextStyle(height: 1.6, color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (quantity == 0) {
                                          quantity = 1;
                                        }
                                        quantity--;
                                      });
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(quantity.toString()),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon: Icon(Icons.add)),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    addLike = !addLike;
                                  });
                                },
                                child: Icon(
                                  addLike
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: addLike ? Colors.red : null,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                    color: widget.products.color,
                                  ),
                                ),
                                padding: EdgeInsets.all(5),
                                child: IconButton(
                                  onPressed: () {
                                    cartItems.add(
                                      Cart(
                                          addedProduct: widget.products,
                                          quantity: quantity,
                                        totalPrice: (widget.products.price*quantity).toDouble()
                                      ),
                                    );
                                    print(cartItems);
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        action: SnackBarAction(label: 'Undo', onPressed: (){
                                          cartItems.remove(cartItems[cartItems.length-1]);
                                        }),
                                        content: Text('Add to cart'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: widget.products.color,
                                    size: 32,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 60),
                                  child: Text(
                                    'BUY NOW',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      widget.products.color),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 370,
                    left: 30,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$${widget.products.price.toString()}',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Hero(
                          tag: widget.products.id,
                          child: Image.asset(
                            widget.products.image,
                            width: 250,
                            height: 300,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
