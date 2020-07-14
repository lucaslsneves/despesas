import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'components/transiction_form.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 100,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 100,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 100,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de energia da casa do jaime junior das neves',
      value: 20000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 100,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];


  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  onSubmit(String title, double value) {
    final transaction =
        Transaction(id: 't4', date: DateTime.now(), title: title, value: value);

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  openForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
              child: TransactionForm(onSubmit: onSubmit));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas pessoais'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => openForm(context),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransactions),
                TransactionList(transactions: _transactions),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => openForm(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
