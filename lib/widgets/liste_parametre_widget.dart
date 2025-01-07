import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ListParametre extends StatelessWidget {
  final String title;
  final Color couleur;

  const ListParametre({
    super.key, 
    required this.title, 
    required this.couleur,
    });

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Row(
            children: [
              // Icone à gauche
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: couleur,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.settings, // Icône représentant un reçu
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(width: 20),

              // Colonne principale (description et date)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),

              // Montant et statut
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 30,),
                  
                ],
              ),
            ],
          );

  }
}