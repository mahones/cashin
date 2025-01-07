import 'package:flutter/material.dart';
import '../../cash/widgets/formulaire_entree_sortie_widget.dart';
import '../../../widgets/profil_widget.dart';
class EntreesPage extends StatelessWidget {
  const EntreesPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:const SingleChildScrollView(
        child: Column(
          children: [
            // afficher le profil
            Padding(
              padding: EdgeInsets.all(20),
              child: ProfileHeader(
                name: 'S. Amah Mahones', 
                date: '20 Décembre 2024'),
            ),
            // fin affichage de profil
            
            // Titre de la page
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                   right: 20,
                   left: 20,
                   top: 10,
                   bottom: 10,
                    ),
                  child: Text(
                  'Entrées',
                  style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                  
                      ),),
                  ),
              ],
            ),
            // fin du titre
           MonFormulaire(),
          ],
        ),
      )
    );
  }
}