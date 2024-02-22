import 'package:flutter/material.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar(
      {super.key, required this.index, required this.onClick});
  final int index;
  final Function(int) onClick;
  @override
  _CustomButtonNavigationBarState createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      onTap: widget.onClick,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo',
        ),
      ],
    );
  }
}
