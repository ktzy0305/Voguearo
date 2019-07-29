import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 300,
      
    );

    return new Scaffold(
      appBar: new AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("Shop Here!"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: (){
              print("Search Button is pressed!");
            },
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: (){
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
                  child: Icon(Icons.person, color: Colors.white, size: 40.0)
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red
              ),
            ),
            // Body
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                // onTap: () => {},
              ),
              onTap: ()=>{}
            ),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
              onTap: ()=>{}
            ),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket),
              ),
              onTap: ()=>{}
            ),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.dashboard),
              ),
              onTap: ()=>{}
            ),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
              onTap: ()=>{}
            ),
            Divider(),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              onTap: ()=>{}
            ),
            InkWell(
              splashColor: Colors.redAccent,
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
              onTap: ()=>{}
            ),
          ],
        ),
      ),
    );
  }
}