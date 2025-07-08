import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/adaptive_text_button.dart';

class NewTransactions extends StatefulWidget {
  final Function addtx;

  const NewTransactions(this.addtx, {super.key});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _sudmitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enterdTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enterdTitle.isEmpty || enterdAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtx(enterdTitle, enterdAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presantDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                // onChanged: (val) => title_input = val,
                controller: titleController,
                onSubmitted: (_) => _sudmitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),

                // onChanged: (val) {amount_input = val;},
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                onSubmitted: (_) => _sudmitData(),
              ),

              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : DateFormat.yMEd().format(_selectedDate!),
                      ),
                    ),
                    AdaptiveTextButton(_presantDatePicker),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('+ add transaction'),
                onPressed: () {
                  _sudmitData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
