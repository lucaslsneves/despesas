import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {
    final Transaction transaction;

  TransactionItem({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple[700],
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$ ${transaction.value.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[700],
                      )),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(transaction.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat('d MMM y').format(transaction.date),
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}