import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta de energia',
      value: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Hamburguer',
      value: 29.90,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Despesas pessoais')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
            Column(
                children: _transactions.map((tr) {
              return ListItem(
                transaction: tr,
              );
            }).toList())
          ],
        ));
  }
}

class ListItem extends StatelessWidget {
  final Transaction transaction;

  ListItem({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple[700],
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$ ${transaction.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[700],
                      ))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Container(
                      color: Colors.blue,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(transaction.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                  Text(
                    DateFormat('d MMM y').format(transaction.date),
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
