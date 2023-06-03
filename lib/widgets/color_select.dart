import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key,required this.inputColor});

final Color inputColor;
  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  bool selectColor=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectColor=!selectColor;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2.5),
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          border: selectColor ? Border.all(width: 2,color:widget.inputColor) : null,
          shape: BoxShape.circle,

        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:widget.inputColor,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}
