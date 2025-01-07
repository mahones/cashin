// lib/routes/app_routes.dart
// ignore_for_file: unused_import

import 'package:biz_manager_app/features/screens/modules/analyse_page.dart';
import 'package:flutter/material.dart';
import '../features/auth/login_page.dart';
import '../features/auth/profile_page.dart';
import '../features/auth/register_page.dart';
import '../features/cash/modules/entree_page.dart';
import '../features/cash/modules/sortie_page.dart';
import '../features/products/modules/produit_modif_page.dart';
import '../features/products/modules/produit_page.dart';
import '../features/products/modules/produit_supp_page.dart';
import '../menu/main_screen.dart';


class AppRoutes {
  // Constantes pour les noms des routes
  static const String main = '/';
  static const String entree_page = '/entreepage';
  static const String sortie_page = '/sortiepage';
  static const String produit_page = '/produitpage';
  static const String supp_produit_page = '/suppproduitpage';
  static const String modif_produit_page = '/modifproduitpage';
  static const String supp_entree_sortie_page = '/suppentreesortiepage';
  static const String modif_entree_sortie_page = '/modifentreesortiepage';
  static const String login_page = '/loginpage';
  static const String signup_page = '/signuppage';
  static const String analyse_page = '/analysepage';
  static const String profil_page = '/profilpage';

  // Méthode qui retourne toutes les routes de l'application
  static Map<String, WidgetBuilder> get routes => {
    main: (context) => const MainScreen(),
    entree_page: (context) => const EntreesPage(),
    sortie_page: (context) => const SortiesPage(),
    produit_page: (context) => const ProduitsPage(),
    analyse_page: (context) => const FinanceDashboard(),
    supp_produit_page: (context) =>  const ProduitsSuppPage(),
    modif_produit_page:(context) => const ProduitsModifPage(),
    login_page: (context) => const LoginPage(),
    signup_page: (context) => const SignupPage(),
    profil_page:(context) => const ProfilePage()

  };

  // Méthode pour gérer les routes inconnues
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('Route ${settings.name} non trouvée'),
        ),
      ),
    );
  }
}