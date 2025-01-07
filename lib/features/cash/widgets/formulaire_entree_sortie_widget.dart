// ignore_for_file: unused_field

import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MonFormulaire extends StatefulWidget {
  const MonFormulaire({super.key});

  @override
  _MonFormulaireState createState() => _MonFormulaireState();
}

class _MonFormulaireState extends State<MonFormulaire> {
  final _formKey = GlobalKey<FormState>();
  String? _descriptiontexte;
  String? _quantitetexte;
  String? _montanttexte;
  String? _selection;
  DateTime? _date;
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
              child:  TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sélectionnez une date',
                    labelStyle: labelTextStyle,
                    ),
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2026),
                    );
                    if (picked != null) {
                      setState(() {
                        _date = picked;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _date?.toString().split(' ')[0] ?? '',
                  ),
                ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child:  DropdownButtonFormField<String>(
                  decoration:  InputDecoration(
                    labelText: 'Produit/Service',
                    hintText: 'Nom de produit / service',
                    labelStyle: labelTextStyle,
                    ),
                  items: _optionsproduits.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selection = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner une option';
                    }
                    return null;
                  },
                ),
            ),

            
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child:  TextFormField(
                  decoration:  InputDecoration(
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
                  decoration:  InputDecoration(
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
                        print('Texte: $_descriptiontexte');
                        print('Texte: $_quantitetexte;');
                        print('Sélection: $_selection');
                        print('Date: $_date');
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