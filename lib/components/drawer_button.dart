import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  final String text;
  final Color splashColor;
  final IconData iconData;
  final Color iconColor;
  final Function tapFunction;

  DrawerButton(this.text, this.splashColor, this.iconData, this.iconColor, this.tapFunction);

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      splashColor: widget.splashColor,
      child: ListTile(
        title: Text(widget.text),
        leading: Icon(
          widget.iconData, 
          color: widget.iconColor,
        ),
      ),
      onTap: () => widget.tapFunction,
    );
  }
}