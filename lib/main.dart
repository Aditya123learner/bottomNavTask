import 'package:bottom_nav_task/widgets/count_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'screens/notification_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/favorites_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // ...
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int notificationCount = 0;
  int cartCount = 0;
  int favoritesCount = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      NotificationScreen(
        count: notificationCount,
        onIncrease: () {
          setState(() {
            notificationCount++;
          });
        },
        onDecrease: () {
          setState(() {
            if (notificationCount > 0) {
              notificationCount--;
            }
          });
        },
      ),
      CartScreen(
        count: cartCount,
        onIncrease: () {
          setState(() {
            cartCount++;
          });
        },
        onDecrease: () {
          setState(() {
            if (cartCount > 0) {
              cartCount--;
            }
          });
        },
      ),
      FavoritesScreen(
        count: favoritesCount,
        onIncrease: () {
          setState(() {
            favoritesCount++;
          });
        },
        onDecrease: () {
          setState(() {
            if (favoritesCount > 0) {
              favoritesCount--;
            }
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CountWidget(
          icon: const Icon(Icons.notifications),
          count: notificationCount,
        ),
        title: "Notifications",
        activeColorPrimary: Colors.blue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.white,
        onPressed: (context) {
          _controller.jumpToTab(0);
        },
      ),
      PersistentBottomNavBarItem(
        icon: CountWidget(
          icon: const Icon(Icons.shopping_cart),
          count: cartCount,
        ),
        title: "Cart",
        activeColorPrimary: Colors.blue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.white,
        onPressed: (context) {
          _controller.jumpToTab(1);
        },
      ),
      PersistentBottomNavBarItem(
        icon: CountWidget(
          icon: const Icon(Icons.favorite),
          count: favoritesCount,
        ),
        title: "Favorites",
        activeColorPrimary: Colors.blue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.white,
        onPressed: (context) {
          _controller.jumpToTab(2);
        },
      ),
    ];
  }
}
