import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import '../features/screens/home_screen.dart';
import '../features/cash/list_screen.dart';
import '../features/products/produit_screen.dart';
import '../features/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ListScreen(),
    ProductScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          gap: 8,
          color: const Color.fromARGB(255, 90, 90, 90),
          activeColor: Colors.white,
          tabBackgroundColor: AppColors.primary,
          padding: const EdgeInsets.all(8),
          onTabChange: _onItemTapped,
          tabs:  [
            GButton(icon: Ionicons.home_outline, text: 'Accueil', iconSize: 30,),
            GButton(icon: Ionicons.list_circle_outline, text: 'Liste', iconSize: 30,),
            GButton(icon: Ionicons.storefront_outline, text: 'Produits', iconSize: 30,),
            GButton(icon: Ionicons.settings_outline, text: 'Parametre', iconSize: 30,),
          ]
          ),
      ),

    );
  }
}

