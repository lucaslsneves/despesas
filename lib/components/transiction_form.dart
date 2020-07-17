import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionForm extends StatefulWidget {
  final Function(String, double,DateTime) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  submitForm() {
    var title = titleController.text;
    var value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value,selectedDate);
  }

  _showDatePicker() async {
   var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
        helpText: '',
        );

     setState(() {
      selectedDate = pickedDate;
    });

   submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (value) => submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(selectedDate == null ? 'Nenhuma data selecionada' : '${DateFormat('d/M/y').format(selectedDate)}'),
                FlatButton(
                  child: Text('Selecionar data'),
                  onPressed: _showDatePicker,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: FlatButton(
                    onPressed: submitForm,
                    child: Text('NOVO REGISTRO',
                        style:
                            TextStyle(fontSize: 16, color: Colors.purple[700])),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
