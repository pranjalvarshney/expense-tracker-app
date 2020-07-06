import 'package:flutter/material.dart';
import 'package:quiz_app/models/transaction.dart';
import 'package:quiz_app/widgets/NewTransaction.dart';
import 'package:quiz_app/widgets/TransactionList.dart';
import 'package:quiz_app/widgets/chart.dart';
import 'package:quiz_app/widgets/total.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> userTransactions = [];

  void _addNewTransaction(String newtitle, double newamount) {
    final newTx = Transaction(
        amount: newamount,
        title: newtitle,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void _removeTransaction(String id) {
    userTransactions.map((tx) {
      if (tx.id == id) {
        setState(() {
          userTransactions.remove(tx);
        });
      }
    }).toList();
  }

  void _startAddnew(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TotalBalance(userTransactions),
            Chart(userTransactions),
            TransactionList(
              transactions: userTransactions,
              removetx: _removeTransaction,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Create",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _startAddnew(context),
      ),
    );
  }
}
