import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSunbmitted;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.labelText,
      this.controller,
      this.onChanged,
      required this.prefixIcon,
      this.obscureText = false,
      this.onSunbmitted,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final hidden = useState(obscureText);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onFieldSubmitted: onSunbmitted,
      validator: validator,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        filled: true,
        fillColor: Colors.blue[350],
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        labelText: labelText,
        suffixIcon: obscureText!
            ? IconButton(
                onPressed: () {
                  hidden.value = !hidden.value!;
                },
                icon: Icon(
                    hidden.value! ? Icons.visibility_off : Icons.visibility),
              )
            : const SizedBox.shrink(),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
      ),
      obscureText: hidden.value!,
    );
  }
}
