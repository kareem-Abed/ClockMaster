import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.grey[800],
        radius: 30,
        child: Icon(
          icon,
          color: Colors.lightBlueAccent,
          size: 36,
        ),
      ),
    );
  }
}
