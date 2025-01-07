import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ListProducts extends StatelessWidget {
  final String title;
  final String type;
  final String quantity;

  const ListProducts({
    super.key, 
    required this.title, 
    required this.type,
    required this.quantity, 
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
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Ionicons.qr_code_outline, // Icône représentant un reçu
                  color: Colors.grey[600],
                  size: 35,
                ),
              ),

              const SizedBox(width: 12),

              // Colonne principale (description et date)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextTheme.bodyLarge
                    ),
                    const SizedBox(height: 4),
                    Text(
                      quantity,
                      style: TextTheme.bodySmall
                    ),
                  ],
                ),
              ),

              // Montant et statut
               Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.modif_produit_page);
                        },
                        child: Icon(
                          Icons.update,
                          color:  Colors.deepPurple,
                          size: 30,
                          ),
                      ),
                        
                       
                        const SizedBox(width: 10,),

                        InkWell(
                          onTap: () {
                          Navigator.pushNamed(context, AppRoutes.supp_produit_page);
                          },
                          child: Icon(
                          Icons.delete,
                          color:  Colors.red,
                          size: 30,
                          ),
                        ),
                       
                        
                    
                    ],
                  )
                ],
              ),
            ],
          );

  }
}