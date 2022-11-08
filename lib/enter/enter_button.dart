import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  const EnterButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(10),
        color: color,
        minWidth: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}
