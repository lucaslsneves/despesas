import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      totalSum = recentTransactions.fold(0, (previousValue, tr) {
        bool sameDay = tr.date.day == weekDay.day;
        bool sameMonth = tr.date.month == weekDay.month;
        bool sameYear = tr.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          return previousValue + tr.value;
        }

        return previousValue;
      });

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (acc, item) {
      return acc + item['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: groupedTransactions.map((tr) {
                return ChartBar(
                  label: tr['day'],
                  value: tr['value'],
                  percent: (tr['value'] as double) / _weekTotalValue,
                );
              }).toList()),
        ),
      ),
    );
  }
}
