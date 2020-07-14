import 'package:flutter/material.dart';


class TransactionForm extends StatefulWidget {

 final Function(String,double) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  submitForm(){
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty ||value <= 0){
      return;
    }
    widget.onSubmit(title,value);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                  TextField(
                    controller: titleController,
                    onSubmitted: (value) => submitForm() ,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                 TextField(
                   controller: valueController,
                   keyboardType: TextInputType.numberWithOptions(decimal: true),
                   onSubmitted:  (value) =>  submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Valor R\$',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: FlatButton(onPressed: submitForm, child: Text('NOVO REGISTRO', style: TextStyle(fontSize: 16,color: Colors.purple[700])),),
                      ),
                    ],
                  )
                  ],
                ),
              ),
            );
  }
}