import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function(String id) removeTransaction;

  TransactionItem({this.transaction,this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                  child: Text('R\$ ${transaction.value}',
                      style: TextStyle(fontSize: 15)))),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        title: Text('${transaction.title}'),
        subtitle: Text('${DateFormat('d MMM y').format(transaction.date)}'),
        trailing: IconButton(
            icon: Icon(Icons.delete), color: Theme.of(context).errorColor,onPressed: () => removeTransaction(transaction.id),),
      ),
    );
  }
}
