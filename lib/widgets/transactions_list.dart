import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactionsList;
  final Function deletetx;

  const TransactionsList(this.transactionsList, this.deletetx, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactionsList.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions add yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      ('assets/images/waiting.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text(
                          '\$ ${transactionsList[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactionsList[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(transactionsList[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 450
                      ? ElevatedButton.icon(
                          icon: Icon(Icons.delete),
                          onPressed: () => deletetx(transactionsList[index].id),
                          label: Text('delete'),
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all<Color>(
                              Colors.red,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () => deletetx(transactionsList[index].id),
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                ),
              );
            },
            itemCount: transactionsList.length,
          );
  }
}

// Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         margin: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.blue, width: 1.5),
//                         ),
//                         child: Text(
//                           '\$ ${transactionsList[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,

//                         children: [
//                           Text(
//                             textAlign: TextAlign.start,
//                             transactionsList[index].title,
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                           Text(
//                             DateFormat.yMMMEd().format(
//                               transactionsList[index].date,
//                             ),
//                             style: TextStyle(color: Colors.grey),
//                             textAlign: TextAlign.start,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
