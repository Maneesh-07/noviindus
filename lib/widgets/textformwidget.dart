import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final double height;
  final TextInputType inputType;
  final int? maxLine;
  final Widget? dropdownButton;
  final Widget? suffixIcon;
  final double? width;
  const TextFormWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.width,
    required this.height,
    required this.inputType,
    this.maxLine,
    this.dropdownButton,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // color: greyS,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 47, 44, 44).withOpacity(0.1),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLine,
          maxLength: maxLine,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: labelText,
            fillColor: kColorBlack,
            focusColor: Colors.black,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 240, 243, 245)),
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
            suffixIcon: dropdownButton,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
          style: const TextStyle(color: kColorBlack),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
