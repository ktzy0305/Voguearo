import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {

  var cart_products = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "L",
      "color": "Black",
      "qty": 1,
    },
    {
      "name": "High Heels",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      "size" : "8",
      "color": "Maroon",
      "qty": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: cart_products.length,
      itemBuilder: (context, index){
        return CartProductViewHolder(
          cart_products[index]["name"], 
          cart_products[index]["picture"],
          cart_products[index]["price"], 
          cart_products[index]["size"], 
          cart_products[index]["color"], 
          cart_products[index]["qty"]);
      },
    );
  }
}

class CartProductViewHolder extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_price;
  final product_size;
  final product_color;
  var product_qty;

  CartProductViewHolder(
    this.product_name,
    this.product_picture,
    this.product_price,
    this.product_size,
    this.product_color,
    this.product_qty,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: Container(
          height: 100.0,
          width: 100.0,
          child: Image.asset(
            product_picture,
            fit: BoxFit.fill,
          ),
        ),
        title: new Container(
          child: new Text(product_name),
          padding: const EdgeInsets.only(top: 5.0),
        ), 
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                // Size
                new Padding(
                  child: Text("Size : "),
                  padding: const EdgeInsets.all(0.0)
                ),
                new Padding(
                  child: Text(
                    product_size, 
                    style: TextStyle(color: Colors.red),
                  ),
                  padding: const EdgeInsets.all(4.0,)
                ),
                // Color
                new Padding(
                  child: new Text("Color : "),
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                ),
                new Padding(
                  child: Text(
                    product_color, 
                    style: TextStyle(color: Colors.red),
                  ),
                  padding: const EdgeInsets.all(4.0)
                ),
              ],
            ),
            // Product Price
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${product_price}",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.only(bottom: 5.0),
            ),
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.arrow_drop_up),
              onPressed: () => increaseQuantity(),
            ),
            new Text(product_qty.toString()),
            new IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () => reduceQuantity(),
            ),
          ],
        ),
      ) 
    );
  }

  void increaseQuantity(){
    product_qty = product_qty + 1;
  }

  void reduceQuantity(){
    if(product_qty > 0){
      product_qty = product_qty - 1;
    }
  }

}