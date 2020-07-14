import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  ChartBar({this.label, this.value, this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Text('R\$${value.toStringAsFixed(2)}'),
        SizedBox(height: 5,),
        Expanded(child: Container(height: 60,width:10, child: null,)),
        SizedBox(height: 5,),
        Text('${label}'),

      ]),
    );
  }
}
