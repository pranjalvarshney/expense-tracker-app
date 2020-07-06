import 'package:flutter/material.dart';
import 'package:quiz_app/models/transaction.dart';

class TotalBalance extends StatelessWidget {
  final List<Transaction> transactions;

  TotalBalance(this.transactions);

  @override
  Widget build(BuildContext context) {
    double sum = 0.0;
    transactions.map((tx) {
      return sum += tx.amount;
    }).toList();

    return Card(
      elevation: 1,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Balance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${sum.toString()}',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                "images/money.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
