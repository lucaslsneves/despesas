import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  TransactionList({
    this.transactions,
    this.removeTransaction,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height * 0.65,
    child: transactions.isEmpty ? Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      Text('Nenhuma transação cadastrada'),
      Container(margin:EdgeInsets.only(top: 50),height: 200,child: Image.asset('assets/images/waiting.png',fit:BoxFit.cover,))
    ],) : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx,index) {
        return TransactionItem(transaction: transactions[index],removeTransaction:removeTransaction);
      },
    ));
  }
}