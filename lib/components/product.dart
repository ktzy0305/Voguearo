import 'package:flutter/material.dart';
import 'package:shop_here/pages/product_details.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
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

class Single_Product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Single_Product(
    this.product_name, 
    this.product_picture, 
    this.product_old_price, 
    this.product_price
  );
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name, 
        child: Material(
          child: InkWell(
            child: GridTile(
              child: Image.asset(product_picture, fit: BoxFit.cover,),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text("\$$product_price", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),),
                  subtitle: Text("\$$product_old_price", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough),),
                ),
              ),
            ),
            // Pass values of product properties to product details page 
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(product_name, product_price, product_old_price, product_picture))),
          )
        ) 
      ),
    );
  }
}