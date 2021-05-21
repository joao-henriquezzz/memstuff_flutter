import 'package:flutter/material.dart';
import 'package:memstuff_manha/helpers/validators.dart';

class TextInputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final Function(String) onSaved;

  const TextInputField({
    Key key,
    this.icon,
    this.label,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validators.inputValidator,
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
      ),
    );
  }
}
