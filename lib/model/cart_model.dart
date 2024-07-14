import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems=[
    //[itemName,itemPrice,imagePath,color]
    ["Avocado","250","lib/images/avocado_new.png",Colors.green],
    ["Banana","100","lib/images/banana.png",Colors.yellow],
    ["Chicken","600","lib/images/chicken.png",Colors.brown],
    ["Water","20","lib/images/water.png",Colors.blue],
  ];
  //list of cart items
  List _cartItems =[];

  get shopItems => _shopItems;

  get cartItems => _cartItems;
  //add item to cart
  void addItemTocart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  //calculate total price
  String calculaTotal(){
    double totalPrice =0;
    for(int i=0;i<_cartItems.length;i++){
      totalPrice+= double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}