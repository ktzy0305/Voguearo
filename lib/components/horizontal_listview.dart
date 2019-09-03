import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Category("images/categories/tshirt.png", "Shirt"),
            Category("images/categories/dress.png", "Dress"),
            Category("images/categories/jeans.png", "Pants"),
            Category("images/categories/formal.png", "Formal"),
            Category("images/categories/informal.png", "Informal"),
            Category("images/categories/shoe.png", "Shoes"),
            Category("images/categories/accessories.png", "Accessories"),
          ],
        ));
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category(this.image_location, this.image_caption);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 100.0,
        height: 50.0,
        child: InkWell(
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 40.0,
              height: 40.0,
            ),
            subtitle: new Container(
              alignment: Alignment.topCenter,
              child: new Padding(
                child: Text(image_caption, 
                  style: TextStyle(fontSize: 11.0),
                ),
                padding: EdgeInsets.only(top: 5.0),
              ),
            ),
          ),
          onTap: () {},
        )
      ),
    );
  }
}
