import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: obscureText? Icon(Icons.visibility_off, color: (Colors.grey[400])!,):
            Icon(Icons.visibility, color: (Colors.grey[400])!,),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: (Colors.grey[400])!,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: (Colors.grey[400])!,
          ),
        ),
      ),
    );
  }
}
