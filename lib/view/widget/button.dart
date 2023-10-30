import 'package:flutter/material.dart';


class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        shape: BoxShape.rectangle
      ),
      child: const Text('Save',style: TextStyle(fontSize: 20),),
    );
  }
}