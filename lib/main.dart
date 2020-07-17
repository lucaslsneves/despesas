import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transaction_list.dart';
import 'components/transiction_form.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: [const Locale('pt', 'BR')],
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
   
  ];


  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  onSubmit(String title, double value,DateTime date) {
    final transaction =
        Transaction(id: Random().nextDouble().toString(), date: date, title: title, value: value);

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

  removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
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
                TransactionList(transactions: _transactions,removeTransaction: removeTransaction),
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
