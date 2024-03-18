import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
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
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
      controller: _controller,
      validator: widget.validator,
      style: const TextStyle(fontSize: 20),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder:const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder:const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.grey[200],
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