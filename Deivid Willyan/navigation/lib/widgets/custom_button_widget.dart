import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final double? titleSize;
  final VoidCallback onPressed;
  final bool disable;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.disable = false,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) return Colors.red;
            if (states.contains(MaterialState.pressed)) return Colors.green;
            return Colors.blue;
          }),
          textStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed))
                return TextStyle(
                    fontSize: titleSize != null ? titleSize! * 2 : 28);
              return TextStyle(fontSize: titleSize);
            },
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
