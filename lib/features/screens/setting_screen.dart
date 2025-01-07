import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../widgets/profil_widget.dart';
import '../../widgets/liste_parametre_widget.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                  'Parametre',
                  style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                  
                      ),),
                  ),
              ],
            ),

            // affichage la liste de parametre
               
               InkWell(
                onTap:(){

                } ,
                child: const Padding(
                      padding: EdgeInsets.all(
                         20,
                      ),
                      child: ListParametre(
                        title: "Parametre application",
                        couleur: AppColors.primary,
                      ),
                    ),
              ),
              InkWell(
                onTap:(){
                  Navigator.pushNamed(context, AppRoutes.profil_page);
                } ,
                child: const  Padding(
                      padding: EdgeInsets.all(
                        20,
                      ),
                      child: ListParametre(
                        title: "Mon profile",
                        couleur: AppColors.primary,
                      ),
                    ),
              ),
              InkWell(
                onTap:(){

                } ,
                child:const  Padding(
                      padding: EdgeInsets.all(
                         20,
                      ),
                      child: ListParametre(
                        title: "Se déconnecter",
                        couleur: AppColors.primary,
                      ),
                    ),
              ),
              InkWell(
                onTap:(){

                } ,
                child: const Padding(
                      padding: EdgeInsets.all(
                        20
                      ),
                      child: ListParametre(
                        title: "Supprimer mon compte",
                        couleur: Colors.red,
                      ),
                    ),
              ),
            // fin de l'affichage de la liste de parametres
          ],
        ),
      ),
    );
  }
}
