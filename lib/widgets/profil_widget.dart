import 'package:flutter/material.dart';


class ProfileHeader extends StatelessWidget {
  final String name;
  final String date;
  final String? avatarUrl; // Optionnel, pour permettre une image réseau ou un avatar par défaut.

  const ProfileHeader({
    super.key,
    required this.name,
    required this.date,
    this.avatarUrl,
  }) ;

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextTheme.displaySmall
                ),
                const SizedBox(height: 4.0),
                Text(
                  date,
                  style: TextTheme.bodySmall
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.blueAccent,
                  backgroundImage: avatarUrl != null
                      ? NetworkImage(avatarUrl!)
                      : null, // Affiche l'image si l'URL est fournie
                  child: avatarUrl == null
                      ? const Icon(
                          Icons.person,
                          size: 32.0,
                          color: Colors.white,
                        )
                      : null, // Icône par défaut si pas d'URL
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
