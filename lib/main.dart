// Import Installed Packages 
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// Import Local Components
import 'package:shop_here/components/horizontal_listview.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

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
        height: 200.0,
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
          indicatorBgPadding: 6.0,
        )
      );

    return new Scaffold(
      appBar: new AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("Shop Here!"),
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
              decoration: new BoxDecoration(color: Colors.red),
            ),
            // Body
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  // onTap: () => {},
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person),
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket),
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("Categories"),
                  leading: Icon(Icons.dashboard),
                ),
                onTap: () => {}),
            InkWell(
                splashColor: Colors.redAccent,
                child: ListTile(
                  title: Text("Favourites"),
                  leading: Icon(Icons.favorite, color: Colors.red),
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
                  leading: Icon(Icons.help, color: Colors.blue),
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
            child: new Text("Categories"),
          ),
          // Horizontal List View for Categories
          HorizontalList(),
        ],
      ),
    );
  }
}
