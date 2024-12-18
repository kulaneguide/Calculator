import 'package:flutter/material.dart';

import 'BMI.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'calculcu;alator.dart';


class BnavigationExample extends StatefulWidget {
  const BnavigationExample({super.key});

  @override
  State<BnavigationExample> createState() => _BnavigationExampleState();
}

class _BnavigationExampleState extends State<BnavigationExample> {

  int _selectedIndex =0;

  List<Widget> _screens=[
    TheFirstScreen(),
    TheSecondScreen(),
    TheThirdScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Account'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'CALCULATOR'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'BMI'
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}



class TheFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingUp();
  }
}

class TheSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalculatorScreen();
  }
}

class TheThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BMICalculator();
  }
}