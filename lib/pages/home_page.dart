// Import Installed Packages 
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// Import Local Components
import 'package:shopify/components/drawer_button.dart';
import 'package:shopify/components/horizontal_listview.dart';
import 'package:shopify/components/product.dart';

// Pages
import 'package:shopify/pages/shopping_cart.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
        height: 180.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/c1.jpg'),
            AssetImage('images/m1.jpeg'),
            AssetImage('images/m2.jpg'),
            AssetImage('images/w1.jpeg'),
            AssetImage('images/w3.jpeg'),
            AssetImage('images/w4.jpeg'),
          ],
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          dotBgColor: Colors.transparent,
          indicatorBgPadding: 6.0,
        )
      );

    return new Scaffold(
      appBar: new AppBar(
        // elevation: 0.0,
        backgroundColor: Color(0xffff5f5f),
        title: Text("Shopify"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              //Implement Search Later
              print("Search Button is pressed!");
            },
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new ShoppingCart()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // Header
            new UserAccountsDrawerHeader(
              accountName: new Text("Kevin Toh"),
              accountEmail: new Text("kevintoh0305@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white, size: 40.0)),
              ),
              decoration: new BoxDecoration(color: Color(0xffff5f5f)),
            ),
            // Body
            DrawerButton("Home", Colors.redAccent, Icons.home, Color(0xffff5f5f), HomeText),
            // InkWell(
            //   splashColor: Colors.redAccent,
            //   child: ListTile(
            //     title: Text("Home"),
            //     leading: Icon(
            //       Icons.home, 
            //       color: Color(0xffff5f5f),
            //     ),
            //   ),
            //   onTap: () => {}
            // ),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(
                    Icons.person,
                    color: Color(0xffff5f5f),
                  ),
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Color(0xffff5f5f),
                  ),
                ),
                onTap: () => {}),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart, 
                  color: Color(0xffff5f5f),
                ),
              ),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new ShoppingCart()))
              }
            ),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("Favourites"),
                  leading: Icon(
                    Icons.favorite, 
                    color: Color(0xffff5f5f)
                  ),
                ),
                onTap: () => {}),
            Divider(),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                ),
                onTap: () => {}),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // Image Carousel
          image_carousel,         
          
          // Padding with 'Categories' text
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Categories", 
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          
          // Horizontal List View for Categories
          HorizontalList(),

          // Padding with '' text
          new Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 8.0),
            child: new Text(
              "Recent Products", 
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          // Grid View
          Container(
            child: Product(), 
            height: 460.0,
          )
        
        ],
      ),
    );
  }
}

void HomeText(){
  print("Home");
}