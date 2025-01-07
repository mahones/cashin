
import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Se Connecter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Vous n\'avez pas encore de compte?',
                    style: TextStyle(
                      fontSize: 11,
                    ),),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.signup_page),
                      child: const Text('Créer un compte', style: TextStyle(
                      fontSize: 11,
                    ),),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    
                    labelText: 'Nom d\'utilisateur',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder()
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.main);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  const Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}