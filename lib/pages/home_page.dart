import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context){
                  return CartPage();
                },
            ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            //good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning,"),
            ),
            const SizedBox(height: 4),
            //Let's order fresh items for you
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  "Let's order fresh items for you",
                  style : TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
              ),
            ),
            const SizedBox(height:24),
            //divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            //fresh items+grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  "Fresh Items",
                  style: TextStyle(fontSize:16),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(builder:(context,value,child){
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding:EdgeInsets.all(12.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 1/1.3,
                  ),
                  itemBuilder: (context,index){
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed:(){
                        Provider.of<CartModel>(context,listen: false)
                            .addItemTocart(index);
                      } ,
                    );
                  },
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
