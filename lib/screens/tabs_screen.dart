import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(key: UniqueKey()),
    FavoritesScreen(),
  ];

  // final List<Map<String, Object>> _pages = [
  //   {
  //     'page': CategoriesScreen(key: UniqueKey()),
  //     'title': 'Categories',
  //   },
  //   {'page': FavoritesScreen(), 'title': 'Favorites'}
  // ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     // initialIndex: 1,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Meals'),
//         bottom: TabBar(tabs: <Widget>[
//           Tab(
//             icon: Icon(Icons.category),
//             text: 'Categories',
//           ),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'Favorites',
//           ),
//         ]),
//       ),
//       body: TabBarView(children: <Widget>[
//         CategoriesScreen(key: UniqueKey()),
//         FavoritesScreen()
//       ]),
//     ),
//   );
// }