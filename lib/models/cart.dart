import 'package:e_commerce_app/models/products.dart';
class Cart{
  Cart({required this.addedProduct,required this.quantity,required this.totalPrice});
  final Products addedProduct;
  final int quantity;
  final double totalPrice;
}
  List<Cart>cartItems=[];

// double get sum {
//   double userTotal=0;
//   for(var price in cartItems){
//     userTotal=userTotal+price.totalPrice;
//   }
//   return userTotal;
// }
int ? removedPosition;
var userRemovedItem;

void removeItem(int position){
  removedPosition=position;
  userRemovedItem=cartItems[position];
  cartItems.removeAt(position);
}
void addRemovedItem(){
  cartItems.insert(removedPosition!,userRemovedItem);
}
double getSum(){
  double userTotal=0;
  for(var price in cartItems){
    userTotal=userTotal+price.totalPrice;
  }
  return userTotal;
}




