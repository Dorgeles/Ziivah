import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final dynamic icon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType type;
  const CustomTextField({
    Key key,
    this.label,
    this.icon,
    this.controller,
    this.type,
    this.isPassword,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: InputBorder.none,
          fillColor: white,
          filled: true,
          prefixIcon: widget.icon == null
              ? null
              : Icon(
                  widget.icon,
                  color: grey,
                  size: 40,
                ),
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 20,
            color: grey,
          ),
        ),
        keyboardType: widget.type,
      ),
    );
  }
}
