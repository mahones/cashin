// ignore_for_file: unused_import

import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../cash/widgets/liste_entree_sortie_widget.dart';
import '../../widgets/bouton_accueil_widget.dart';
import '../../widgets/profil_widget.dart';
import 'package:ionicons/ionicons.dart';

import 'modules/analyse_page.dart';


// Page d'accueil avec les modules
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
           const Padding(
            padding: EdgeInsets.all(20),
            child: ProfileHeader(name: 'S. Amah Mahones', date: '20 Décembre 2024'),
            ),
             const SizedBox(height: 20),
             Text(
              'Somme Total',
              style: TextTheme.displaySmall,
            ),
             Text(
              '1 000 000 Fcfa',
              style: TextTheme.displayLarge,
            ),
            // bouton de navigations
            const SizedBox(height: 20),
             
              Row(
                children: [
                 
                    Expanded(
                      child: BoutonWidget(
                        icon: Ionicons.add_circle_outline, 
                        label: 'Entrée',
                        onPressed: (){
                         Navigator.pushNamed(context, AppRoutes.entree_page);
                        },
                        ),
                    ),
                    Expanded(
                      child: BoutonWidget(
                        icon: Ionicons.remove_circle_outline, 
                        label: 'Sortie',
                        onPressed: (){
                          Navigator.pushNamed(context, AppRoutes.sortie_page);
                        },),
                    ),
                    Expanded(
                      child: BoutonWidget(
                          icon: Ionicons.qr_code_outline, 
                          label: 'Produits',
                          onPressed: (){
                          Navigator.pushNamed(context, AppRoutes.produit_page);
                        },),
                    ),
                    Expanded(
                      child: BoutonWidget(
                        icon: Ionicons.stats_chart_outline, 
                        label: 'Analyses',
                        onPressed: (){
                           Navigator.pushNamed(context, AppRoutes.analyse_page);
                        },),
                    ),
                ],
              ),
           
            // affiche publicitaire
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ), 
                      child: const Center(
                        child: Text(
                          'affiche publicitaire', 
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
            // fin de l'affiche publicitaire
            // ligne pour le text des transactions
              Row(
              children: [
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                     right: 20,
                     left: 20,
                     top: 10,
                     bottom: 10,
                  
                      ),
                    child: Text('Liste des transactions',
                      style: TextTheme.displaySmall
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                   right: 20,
                   left: 20,
                   top: 10,
                   bottom: 10,

                    ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.analyse_page);
                    },
                    child: Text('Voir toute la liste',
                      style: TextTheme.bodySmall,
                      ),
                  ),
                  ),
              ],
            ),
         
            //fin de la ligne des transactions
            // liste des transaction 
          const SizedBox(height: 20),
          const Padding(
            padding:  EdgeInsets.only(
              right: 20,
              left: 20,
              top: 5,
              bottom: 5,
              ),
            child:  ListCashinout(
              title: "j'ai fait une entrée", 
              amount: '200 000', 
              date: '20 Dec 2024', 
              type: 'Entrée',
              ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding:  EdgeInsets.only(
              right: 20,
              left: 20,
              top: 5,
              bottom: 5,
              ),
            child:  ListCashinout(
              title: "j'ai fait une entrée", 
              amount: '200 000', 
              date: '20 Dec 2024', 
              type: 'Entrée',
              ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding:  EdgeInsets.only(
              right: 20,
              left: 20,
              top: 5,
              bottom: 5,
              ),
            child:  ListCashinout(
              title: "j'ai fait une entrée", 
              amount: '200 000', 
              date: '20 Dec 2024', 
              type: 'Entrée',
              ),
          ),         
          
          ],
          
        ),
      ),
    
    );
  }
}

