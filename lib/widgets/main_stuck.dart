import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_button_navigation_bar.dart';
import 'package:flutter_application_1/widgets/my_home_page.dart';
import 'package:flutter_application_1/widgets/todo_list.dart';

class MainStuck extends StatefulWidget {
  const MainStuck({super.key});

  @override
  State<MainStuck> createState() => _MainStuckState();
}

class _MainStuckState extends State<MainStuck> {
  List<Widget> screens = [
    const MyHomePage(),
    const TodoList(),
  ];

  int currentScreen = 0;
   void onClick(val) {
    setState(() {
      currentScreen = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(name: "NavBar"),
       body: IndexedStack(
        index: currentScreen,
        children: screens,
      ),
      bottomNavigationBar: CustomButtonNavigationBar(index: currentScreen,onClick: onClick,),
    );
  }
}
