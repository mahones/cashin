import 'package:biz_manager_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


import 'widgets/liste_entree_sortie_widget.dart';
import '../../widgets/bouton_simple_widget.dart';
import '../../widgets/profil_widget.dart';



class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                  'Liste des transactions',
                  style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                  
                      ),),
                  ),
              ],
            ),
            
            // ajoute bouton
            Row(
              children: [
                Expanded(
                  child: BoutonSimple(
                    icon: Ionicons.add_circle_outline, 
                    label: 'Cash in', 
                    couleur: Colors.white, 
                    mybg: Colors.green, 
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.entree_page);
                    }
                    ),
                ),
                Expanded(
                  child: BoutonSimple(
                    icon: Ionicons.remove_circle_outline, 
                    label: 'Cash out', 
                    couleur: Colors.white, 
                    mybg: Colors.red, 
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.sortie_page);
                    }
                    ),
                ),
              ],
            ),
            
            // fin ajout bouton

            //bouton cash out et cash in
            const Row(
              children: [
                
              ],
            ),
            // fin bouton cash out cash in

            // affichage la liste des transactions
               
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
              const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListCashinout(
                      title: "j'ai fait une entrée",
                      amount: '200 000',
                      date: '20 Dec 2024',
                      type: 'Entrée',
                    ),
                  ),
            
            // fin de l'affichage de la liste des transactions
          ],
        ),
      ),
    );
  }
}