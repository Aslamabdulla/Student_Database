import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) => BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: newIndex,
        onTap: (index) {
          indexChangeNotifier.value = index;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: "ADD STUDENTS",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "DETAILS",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
        ],
      ),
    );
  }
}
