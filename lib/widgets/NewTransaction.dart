import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitData() {
    final ntitle = titleInputController.text;
    final namount = double.parse(amountInputController.text);

    if (ntitle.isEmpty || namount <= 0) return null;
    widget.addNewTx(ntitle, namount);
    Navigator.of(context).pop();
  }

  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleInputController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
                controller: amountInputController,
                onSubmitted: (_) => submitData,
                keyboardType: TextInputType.number),
            FlatButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.orange,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
