import 'package:flutter/material.dart';

class BoutonSimple extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color couleur;
  final Color mybg;
  final VoidCallback onPressed;

  const BoutonSimple({
    super.key,
    required this.icon,
    required this.label,
    required this.couleur,
    required this.mybg,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton(
        heroTag: label,
                onPressed: onPressed,
                backgroundColor: mybg,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                     
                ),
      
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: couleur,
                      size: 30,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      label,
                      style: TextStyle(
                        color: couleur,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
                ),
    );

  }
}
