import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stocktaking_app/model/items.dart';
import 'package:stocktaking_app/view/widget/button.dart';

class StocktakinDoc extends StatefulWidget {
  const StocktakinDoc({super.key});

  @override
  State<StocktakinDoc> createState() => _StocktakinDocState();
}

class _StocktakinDocState extends State<StocktakinDoc> {
  TextEditingController barCode = TextEditingController();
  TextEditingController quantity = TextEditingController();
  int documentNumber = 1;
  Itemsdb itemsdb = Itemsdb();
  readDocNumber() {
    int? docNum;
    setState(() {
      docNum =
          itemsdb.readData('SELECT RecordDocumentNumber FREOM StockRecords');
    });
    return docNum;
  }

  readName() {
    String? docNum;
     setState(() {
       docNum =
        itemsdb.readData('SELECT ItemName , ItemQuantity FREOM StockRecords');
     });
    return docNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Document No.${readDocNumber()}',
            style: const TextStyle(fontSize: 25),
          ),
          Row(
            children: [
              TextField(
                controller: barCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'BarCode',
                ),
              ),
              TextField(
                controller: quantity,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Default Value 1',
                  labelText: 'Quantity',
                ),
                onSubmitted: (value) {
                  if (quantity.value == null) {
                    quantity.value = documentNumber as TextEditingValue;
                  }
                },
              ),
            ],
          ),
          const SaveButton(),
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black)),
            child: Text('${readName()}'),
          ),
          const SaveButton(),
        ],
      ),
    );
  }
}
