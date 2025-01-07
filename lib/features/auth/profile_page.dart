import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;
  bool _obscurePassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isChangingPassword = false;

  // Controllers pour les champs de texte
  final _firstNameController = TextEditingController(text: "John");
  final _lastNameController = TextEditingController(text: "Doe");
  final _emailController = TextEditingController(text: "john.doe@example.com");
  final _phoneController = TextEditingController(text: "+228 90 00 00 00");
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Logique pour sauvegarder les modifications
      setState(() {
        _isEditing = false;
        _isChangingPassword = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil mis à jour avec succès')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    );
    
    final labelTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[700],
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                _isChangingPassword = false;
              });
            },
          ),
        ],
      ),
      body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Photo de profil
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
                      ),
                      if (_isEditing)
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // Logique pour changer la photo
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Prénom
                  TextFormField(
                    controller: _firstNameController,
                    style: inputTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      labelStyle: labelTextStyle,
                      enabled: _isEditing,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre prénom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Nom
                  TextFormField(
                    controller: _lastNameController,
                    style: inputTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      labelStyle: labelTextStyle,
                      enabled: _isEditing,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    style: inputTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: labelTextStyle,
                      enabled: _isEditing,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                      if (!value.contains('@')) {
                        return 'Veuillez entrer un email valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Téléphone
                  TextFormField(
                    controller: _phoneController,
                    style: inputTextStyle,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Téléphone',
                      labelStyle: labelTextStyle,
                      enabled: _isEditing,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre numéro de téléphone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Bouton Changer le mot de passe
                  if (_isEditing && !_isChangingPassword)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isChangingPassword = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Changer le mot de passe',
                        style: TextStyle(fontSize: 16,
                        color:  Colors.white),
                      ),
                    ),

                  // Formulaire de changement de mot de passe
                  if (_isChangingPassword) ...[
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _currentPasswordController,
                      style: inputTextStyle,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe actuel',
                        labelStyle: labelTextStyle,
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      validator: (value) {
                        if (_isChangingPassword && (value == null || value.isEmpty)) {
                          return 'Veuillez entrer votre mot de passe actuel';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _newPasswordController,
                      style: inputTextStyle,
                      obscureText: _obscureNewPassword,
                      decoration: InputDecoration(
                        labelText: 'Nouveau mot de passe',
                        labelStyle: labelTextStyle,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureNewPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscureNewPassword = !_obscureNewPassword),
                        ),
                      ),
                      validator: (value) {
                        if (_isChangingPassword) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un nouveau mot de passe';
                          }
                          if (value.length < 6) {
                            return 'Le mot de passe doit contenir au moins 6 caractères';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      style: inputTextStyle,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirmer le nouveau mot de passe',
                        labelStyle: labelTextStyle,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                        ),
                      ),
                      validator: (value) {
                        if (_isChangingPassword) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez confirmer votre nouveau mot de passe';
                          }
                          if (value != _newPasswordController.text) {
                            return 'Les mots de passe ne correspondent pas';
                          }
                        }
                        return null;
                      },
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Bouton Sauvegarder
                  if (_isEditing)
                    ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sauvegarder',
                        style: TextStyle(fontSize: 16,
                        color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}