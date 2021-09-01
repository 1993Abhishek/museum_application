import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

typedef OnTextChangeValidator<String> = bool Function(String value);

class CustomTextfieldWidget extends StatefulWidget {
  final bool disableBorder;
  final bool isLebelTextNeeded;
  final Widget suffixWidget;
  final bool isLeftAlignLebel;
  final String hintText;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onTap;
  final Color selectedColor;
  final Color unSelectedColor;
  final Function onSubmitted;
  final String readOnlyValue;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;
  final TextStyle textStyle;
  final TextStyle labelTextStyle;
  final double gapBetween;
  final EdgeInsetsGeometry contentPadding;
  final Function onChange;
  final double elevation;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final Widget prefixWidget;
  final String lebelText;
  final double width;
  final double height;
  final double lebelHeight;

  CustomTextfieldWidget({
    this.disableBorder=false,
    this.isLebelTextNeeded=true,
    this.suffixWidget,
    this.lebelText,
    this.isLeftAlignLebel = false,
    this.height,
    this.lebelHeight,
    this.width,
    this.prefixWidget,
    this.textAlignVertical,
    this.textAlign,
    this.expands = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onTap,
    this.selectedColor,
    this.unSelectedColor,
    this.onSubmitted,
    this.readOnlyValue = "",
    this.obscureText = false,
    this.inputFormatter,
    this.textStyle,
    this.labelTextStyle,
    this.gapBetween,
    this.minLines,
    this.contentPadding,
    this.onChange,
    this.elevation = 1,
  });

  @override
  _CustomTextfieldWidgetState createState() => _CustomTextfieldWidgetState();
}

class _CustomTextfieldWidgetState extends State<CustomTextfieldWidget> {
  bool textChangeValidationSuccess = false;
  Widget checkWidget = Icon(
    Icons.check,
    color: Colors.white70,
    size: hDimen(18),
  );
  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: hDimen(16),
  );
  final TextStyle hintTextStyle = TextStyle(
    color: Colors.black45,
    fontSize: hDimen(18),
  );
  final OutlineInputBorder normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.white60,
      width: 0.8,
    ),
  );

  final OutlineInputBorder transparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
  );

  final OutlineInputBorder selectedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(hDimen(8)),
    borderSide: BorderSide(
      color: Colors.white70,
      width: 1.2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height == null ? hDimen(76):(widget.height+hDimen(30)),
      width: widget.width == null ? hDimen(120) : widget.width,
      child: Column(
        crossAxisAlignment: widget.isLeftAlignLebel
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.isLebelTextNeeded ? Padding(
            padding: widget.isLeftAlignLebel
                ? EdgeInsets.only(
              left: hDimen(10),
            )
                : EdgeInsets.all(0),
            child: Text(
              widget.lebelText,
              style: TextStyle(
                color: Colors.black,
                fontSize: widget.lebelHeight == null
                    ? hDimen(13)
                    : widget.lebelHeight,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ):Container(),
          vSpacing(hDimen(5)),
          Container(
            height: widget.height == null ? hDimen(40) : widget.height,
            decoration: BoxDecoration(
                color: widget.unSelectedColor == null
                    ? Colors.white
                    : widget.unSelectedColor,
                borderRadius:!widget.disableBorder ? BorderRadius.circular(
                  hDimen(20),
                ):BorderRadius.circular(
                  hDimen(0),
                )
            ),
            child: TextFormField(
              textAlignVertical: widget.textAlignVertical,
              readOnly: widget.readOnly,
              maxLines: widget.maxLines,
              enableSuggestions: false,
              focusNode: widget.focusNode,
              controller: widget.controller,
              inputFormatters: widget.inputFormatter,
              onTap: () {
                if (widget.onTap != null) widget.onTap();
              },
              onFieldSubmitted: (value) {
                if (widget.onSubmitted != null) {
                  widget.onSubmitted(value);
                }
              },
              obscureText: widget.obscureText,
              maxLength: widget.maxLength,
              cursorColor: Colors.black,
              minLines: widget.minLines,
              keyboardType: widget.inputType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              textAlign: widget.textAlign == null
                  ? TextAlign.start
                  : widget.textAlign,
              onChanged: (value) {
                if (widget.onChange != null) widget.onChange(value);
              },
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixWidget,
                contentPadding: widget.contentPadding != null
                    ? widget.contentPadding
                    : widget.maxLines > 1
                    ? EdgeInsets.only(
                  top: hDimen(10),
                  left: hDimen(15),
                  right: hDimen(widget.suffixIcon != null ? 0 : 2),
                )
                    : EdgeInsets.only(
                  left: hDimen(15),
                  right: hDimen(widget.suffixIcon != null ? 0 : 2),
                ),
                counterText: '',
                hintText: widget.hintText,
                hintStyle: hintTextStyle,
                enabledBorder: transparentBorder,
                focusedBorder: selectedBorder,
                border: transparentBorder,
              ),
              style: widget.textStyle != null ? widget.textStyle : textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
