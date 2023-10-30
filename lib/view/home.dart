import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stocktaking_app/view/newdoc.dart';

class CheckInventory extends StatelessWidget {
  const CheckInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const StocktakinDoc())));
              },
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.rectangle),
                  ),
                  const Text(
                    'New Stocking Document',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const CheckInventory())));
              },
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Colors.orange, shape: BoxShape.rectangle),
                  ),
                  const Text(
                    'Check Inventory',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
