import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BoutonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const BoutonWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65,
          width: 65,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: label,
              onPressed: onPressed, 
              shape: const CircleBorder(),
              backgroundColor: AppColors.primary,
              
              child: Icon(
                          icon,
                          color:Colors.white ,
                          size: 30,
                        ),
            ),
          ),
        ),
        
        const SizedBox(height: 10.0),

        Text(
          label,
          style: TextTheme.bodySmall
        ),
      ],
    );
  }
}
