import 'package:flutter/material.dart';


class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool security;
  final IconData icon;
  final TextEditingController controller;
  final Function()? onTap;
  const MyTextfield({super.key, required this.hintText, required this.security,this.onTap, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: security,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        labelText: hintText,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(icon,
            )
        ),
      ),
    );
  }
}
