import 'package:flutter/material.dart';

void showSnakbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: Border(
          top: BorderSide(width: 1, color: Colors.black.withOpacity(0.2))),
    ),
  );
}
