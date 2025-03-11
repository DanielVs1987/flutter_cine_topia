import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/ui/screens/releses.dart';
import 'package:flutter_cine_topia/ui/screens/search_movies.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  int _currentIndex = 0;
  final List<Widget> _screens = <Widget>[SearchMovies(counter: 1,), Releses()];

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF120326),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 54, 16, 0),
        child: _screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.purple[600],
          onTap: (value) => updateIndex(value),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.movie), label: "Filmes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.today), label: "Lançamentos"),
          ]),
    );
  }
}
