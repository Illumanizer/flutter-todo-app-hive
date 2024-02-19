import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var selectedIndex = 0;
  final List<dynamic> _pages = [
    HomePage(),
  ];
  void _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => _pages[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: _pages[selectedIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: selectedIndex,
        //   onTap: _navigateBottomBar,
        //   items: const <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.business),
            //   label: 'Business',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.school),
            //   label: 'School',
            // ),
          // ],
        // ),
        );
  }
}
