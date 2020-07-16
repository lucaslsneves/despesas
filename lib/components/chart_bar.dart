import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  ChartBar({this.label, this.value, this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          FittedBox(child: Text('R\$ ${value.toStringAsFixed(2)}')),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: Container(
            height: 60,
            width: 13,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percent,
                  child: Container(
                     decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      
                      borderRadius: BorderRadius.circular(6.5),
                      ),
                  ),
                )
              ],
            ),
          )),
          SizedBox(
            height: 5,
          ),
          Text('${label}'),
        ]),
      ),
    );
  }
}
