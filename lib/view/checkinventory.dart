import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/items.dart';

class CheckInventory extends StatefulWidget {
  const CheckInventory({super.key});

  @override
  State<CheckInventory> createState() => _CheckInventory();
}

class _CheckInventory extends State<CheckInventory> {
  TextEditingController barCode = TextEditingController();
  Itemsdb itemsdb = Itemsdb();
  readName() {
    String? docNum;
    setState(() {
      docNum = itemsdb.readData(
        'SELECT ItemName FREOM StockRecords WHERE ItemBarcode = ${barCode.text}');
    });
    return docNum;
  }

  readQuantity() {
    int? docNum;
    setState(() {
      docNum = itemsdb.readData(
          'SELECT ItemQuantity FREOM StockRecords WHERE ItemBarcode = ${barCode.text}');
    });
    return docNum;
  }

  readPrice() {
    int? docNum;
    setState(() {
      docNum = itemsdb.readData(
          'SELECT ItemPrice FREOM StockRecords WHERE ItemBarcode = ${barCode.text}');
    });
    return docNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: barCode,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter BarCode',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(' Name ${readName()}'),
        const SizedBox(
          height: 20,
        ),
        Text(' Price ${readPrice()}'),
        const SizedBox(
          height: 20,
        ),
        Text(' Quantity ${readQuantity()}'),
      ]),
    );
  }
}
