// ignore_for_file: unused_field

import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MonFormulaireProduit extends StatefulWidget {
  const MonFormulaireProduit({super.key});

  @override
  _MonFormulaireProduitState createState() => _MonFormulaireProduitState();
}

class _MonFormulaireProduitState extends State<MonFormulaireProduit> {
  final _formKey = GlobalKey<FormState>();
  String? _nomproduit;
  String? _quantitetexte;
  String? _montanttexte;

  final List<String> _optionsproduits = ['Produit 1', 'Produit 2', 'Produit 3'];

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[700],
      fontWeight: FontWeight.normal,
    );
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom produit',
                  hintText: 'Nom produit',
                  labelStyle: labelTextStyle,
                  ),
                onSaved: (value) => _nomproduit = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la quantité';
                  }
                  return null;
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantité',
                  hintText: 'Quantité',
                  labelStyle: labelTextStyle,
                  ),
                onSaved: (value) => _quantitetexte = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la quantité';
                  }
                  return null;
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Montant',
                  hintText: 'Montant',
                  labelStyle: labelTextStyle,
                  ),
                onSaved: (value) => _montanttexte = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le montant';
                  }
                  return null;
                },
              ),
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child:  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: (){
                       if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Traiter les données du formulaire
                        
                      }
                      }, 
                      child: const Row(
                        children: [
                          Icon(Ionicons.save_outline, color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Enregistrer',
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
                

          ],
        ),
      ),
    );
  }
}