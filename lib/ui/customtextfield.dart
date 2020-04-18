import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Helper.width(50, size),
          vertical: Helper.height(20, size)),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle:
                Theme.of(context).textTheme.headline2.copyWith(fontSize: 14),
            hintText: hint,
            hintStyle:
                Theme.of(context).textTheme.headline1.copyWith(fontSize: 18),
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
            .copyWith(fontSize: 18, color: MyColors.BLACK),
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
