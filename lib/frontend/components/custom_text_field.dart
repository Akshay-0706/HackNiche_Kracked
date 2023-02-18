import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../size.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.onChanged, required this.controller}) : super(key: key);
  final Function onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHeight(10)),
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
          onFieldSubmitted: (value) => onChanged(value.trim()),
          keyboardType: TextInputType.text,
          // inputFormatters: [
          //   // for below version 2 use this
          //   FilteringTextInputFormatter.allow(RegExp(reg)),
          // ],
          cursorRadius: const Radius.circular(8),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Add a comment",
            counterText: "",
            hintStyle: TextStyle(
                color: Theme.of(context).primaryColorDark.withOpacity(0.4),
                fontSize: getHeight(16)),
          ),
        ),
      ),
    );
  }
}
