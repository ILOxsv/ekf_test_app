import 'package:ekf_test_app/common/mycolors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget suffix;
  final Function(String) onSubmitted;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final FocusNode focus;

  const CustomTextField(
      {Key key,
      this.controller,
      this.label,
      this.hint,
      this.textCapitalization: TextCapitalization.words,
      this.suffix,
      this.focus,
      this.onSubmitted})
      : assert(controller != null &&
            label != null &&
            hint != null &&
            focus != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 75),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle:
                Theme.of(context).textTheme.headline2.copyWith(fontSize: 12),
            hintText: hint,
            hintStyle:
                Theme.of(context).textTheme.headline1.copyWith(fontSize: 14),
            suffixIcon: suffix,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.GREY, width: 2),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.BLUE, width: 2),
                borderRadius: BorderRadius.circular(12))),
        style: Theme.of(context)
            .textTheme
            .headline1
            .copyWith(fontSize: 14, color: MyColors.BLACK),
        controller: controller,
        focusNode: focus,
        onSubmitted: onSubmitted,
        autocorrect: false,
        textCapitalization: textCapitalization,
        autofocus: true,
      ),
    );
  }
}
