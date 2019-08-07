import 'package:flutter/material.dart';

// Component Imports
import 'package:shop_here/components/cart_product.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print("Search Button is pressed!");
            },
          ),
        ],
      ),
      body: new CartProduct(),
      bottomNavigationBar: new Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total : "),
                subtitle: new Text("\$230.00"),
              ),
            ),
            Expanded(
              child : new MaterialButton(
                child: new Text(
                  "Check Out", 
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}