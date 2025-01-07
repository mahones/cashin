import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ListCashinout extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String type;

  const ListCashinout({
    super.key, 
    required this.title, 
    required this.date, 
    required this.amount, 
    required this.type, 
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
                  Ionicons.ticket_outline, // Icône représentant un reçu
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
                      style:  TextTheme.bodyLarge,                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
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
                  Text(
                    '+ $amount fcfa',
                    style:  TextTheme.bodyLarge
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );

  }
}