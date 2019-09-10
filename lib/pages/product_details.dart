import 'package:flutter/material.dart';
import 'package:shopify/pages/home_page.dart';
import 'package:shopify/components/product.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails(this.product_details_name, this.product_details_new_price,
      this.product_details_old_price, this.product_details_picture);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.red,
        title: InkWell(
          child: Text("Shop Here!"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
          },
        ), 
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print("Search Button is pressed!");
            },
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              print("Shopping Cart is pressed!");
            },
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: GridTile(
              child: Container(
                child: Image.asset(widget.product_details_picture),
                color: Colors.white,
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_details_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${widget.product_details_old_price}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\$${widget.product_details_new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            height: 300.0,
          ),

          // First Button Group
          Row(
            children: <Widget>[
              // Size Button
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text("Size"),
                              content: new Text("Select a size"),
                              actions: <Widget>[
                                new MaterialButton(
                                  child: new Text("Close"),
                                  onPressed: () =>
                                      {Navigator.of(context).pop(context)},
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Size"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
              // Colour Button
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Select a color"),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Close"),
                                onPressed: () =>
                                    {Navigator.of(context).pop(context)},
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Colour"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
              // Quantity Button
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text("Quantity"),
                              content: new Text("Select a quantity"),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text("Close"),
                                  onPressed: () =>
                                      {Navigator.of(context).pop(context)},
                                ),
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Qty"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
            ],
          ),

          // Second Button Group

          // First Button Group
          Row(
            children: <Widget>[
              // Buy Button
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy Now")),
              ),
              new IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          Divider(),
          // Product Condition
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("Product name",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_details_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("Product brand",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("Product condition",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              )
            ],
          ),
          Divider(),
          // Similar Products
          Padding(
            child: new Text(
              "Similar Products",
              style: TextStyle(fontSize: 16.0),
            ),
            padding: const EdgeInsets.all(12.0),
          ),
          Container(
            child: SimilarProducts(),
            height: 360.0,
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "High Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Floral Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 49,
      "price": 19,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Single_Product(
          product_list[index]['name'],
          product_list[index]['picture'],
          product_list[index]['old_price'],
          product_list[index]['price']
        );
      },
    );
  }
}