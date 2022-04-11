
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vlogpost/Utils/colors.dart';


// ignore: must_be_immutable
class CustomLabelTextField extends StatefulWidget {
  CustomLabelTextField(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      this.hintText,
      this.focusNode,
      this.nextNode,
      this.onFieldSubmitted,
      this.textInputAction,
      this.textInputType,
      this.length,
      this.onTap,
      this.textCapitalization,
      this.labelText,
      this.inputFormatters,
      this.isPrivate = false,
      this.changePrivacy})
      : super(key: key);
  final TextEditingController controller;
  bool obscureText;
  final String? hintText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function()? onTap;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onFieldSubmitted;
  final int? length;
  final String? labelText;
  bool isPrivate;
  final VoidCallback? changePrivacy;

  @override
  _CustomLabelTextFieldState createState() => _CustomLabelTextFieldState();
}

class _CustomLabelTextFieldState extends State<CustomLabelTextField> {
  final controller = TextEditingController();
  @override
  void initState() {
    focusNode.addListener(_focusNodeListner);
    super.initState();
  }

  Future<void> _focusNodeListner() async {
    if (focusNode.hasFocus) {
      print('text field got focus');
    } else {
      print('text field lost focus');
    }
  }

  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  bool isPrivate = false;
  @override
  Widget build(BuildContext context) {
    void _onFieldSubmitted(String text) {
      widget.onFieldSubmitted?.call(text);
      if (widget.nextNode != null) {
        widget.nextNode!.requestFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: widget.isPrivate ? AppColor.privateBg : Colors.transparent,
        border: Border.all(
          color: AppColor.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: 5,
        onFieldSubmitted: _onFieldSubmitted,
        validator: (value) {
          if (value == null || value == '') {
            return '${widget.hintText} is required.';
          }
        },
        focusNode: focusNode,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        onTap: widget.onTap,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters ?? [],
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction ??
            (widget.nextNode == null
                ? TextInputAction.done
                : TextInputAction.next),
        cursorColor: AppColor.textBlack,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.changePrivacy != null)
                InkWell(
                  onTap: widget.changePrivacy,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: widget.isPrivate
                          ? AppColor.orange
                          : AppColor.border,
                    ),
                    child: Icon(
                      widget.isPrivate ? Icons.lock_outline : Icons.lock_open,
                      color: AppColor.iconsWhite,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          isDense: true,
          labelText: widget.hintText,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
