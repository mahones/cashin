import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../widgets/profil_widget.dart';
import 'widgets/liste_produit_widget.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             const Padding(
              padding: EdgeInsets.all(20),
              child: ProfileHeader(
                name: 'S. Amah Mahones', 
                date: '20 Décembre 2024'),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                   right: 20,
                   left: 20,
                   top: 10,
                   bottom: 10,

                    ),
                  child: Text(
                  'Liste des produits',
                  style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                  
                      ),),
                  ),
              ],
            ),
              
             Row(
              children: [
                Container(
                  margin:  const EdgeInsets.all(20),
                  child:  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.produit_page);
                      }, 
                      child: const Row(
                        children: [
                          Icon(Ionicons.save_outline, color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Ajouter un produit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ],
                      )
                      ),
                  ),
                ),
              ],
             ),
    
            // affichage la liste des produits
               
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListProducts(
                      title: "Produit",
                      type: 'Entrée',
                      quantity: '20',
                    ),
                  ),
 
            // fin de l'affichage de la liste des produits
          ],
        ),
      ),
    );
  }
}