import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/money2.png",
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                Text(
                  "No transactions",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 0),
                Text(
                  "Click + to create transactions",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                transactions[index].amount > 0 ? "+" : "-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: transactions[index].amount > 0
                                    ? Colors.green[400]
                                    : Colors.red[300],
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transactions[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  DateFormat.yMMMMd("en_US")
                                      .add_jm()
                                      .format(transactions[index].date),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            " \$ " +
                                transactions[index].amount.abs().toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
