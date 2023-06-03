import 'package:flutter/material.dart';

class Products {
  Products(
      {required this.id,
      required this.image,
      required this.price,
      required this.size,
      required this.name,
      required this.description,
      required this.color});
  final int id, price, size;
  final String image, name, description;
  final Color color;
}

List<Products> products = [
  Products(
      id: 1,
      name: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Products(
      id: 2,
      name: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Products(
      id: 3,
      name: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Products(
      id: 4,
      name: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Products(
      id: 5,
      name: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Products(
    id: 6,
    name: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
