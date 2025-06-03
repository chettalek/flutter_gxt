import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gxt/views/employee_list_view.dart';
import 'package:flutter_gxt/views/outsource_list_view.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
  ));
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [EmployeeListView(), OutsourceListView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'พนักงาน'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Outsource'),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
