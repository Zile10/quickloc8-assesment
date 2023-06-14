import 'package:flutter/material.dart';
import '../widgets/map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(239, 66, 36, 1),
        title: const Center(
          child: Text('Flutter App'),
        ),
      ),
      body: const Map(),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     setState(() {
      //       counter++;
      //     });
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(),
      ),
    );
  }
}
