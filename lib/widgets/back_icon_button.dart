
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackIconButton({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back_ios_new_sharp),
    );
  }
}
