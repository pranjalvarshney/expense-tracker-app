import 'package:flutter/material.dart';
import 'package:quiz_app/models/transaction.dart';
import 'package:quiz_app/widgets/NewTransaction.dart';
import 'package:quiz_app/widgets/TransactionList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> userTransactions = [
    Transaction(id: "t1", title: "Shoes", amount: 50, date: DateTime.now()),
    Transaction(id: "t2", title: "Carpet", amount: 30, date: DateTime.now()),
    Transaction(id: "t3", title: "Watch", amount: 100, date: DateTime.now())
  ];

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
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[TransactionList(userTransactions)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "+",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        onPressed: () => _startAddnew(context),
      ),
    );
  }
}
