import 'package:flutter/material.dart';

class TextFieldWidgetByEdit extends StatefulWidget {
  const TextFieldWidgetByEdit(
      {this.controller,
      this.validator,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.initialValue,
      super.key});

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;

  @override
  State<TextFieldWidgetByEdit> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidgetByEdit> {
  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _globalKey,
      onChanged: (value) {
         if (_globalKey.currentState?.validate() == true) {
        widget.onChanged?.call(value);
         }
      },
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(fontSize: 12),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder:const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                enabledBorder:const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                fillColor: Colors.white,
                filled: true,
            ),
        );
    
  }
   @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}