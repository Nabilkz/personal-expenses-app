import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transactions_list.dart';
import './models/transactions.dart';
import 'widgets/new_transactions.dart';

void main() {
  var hi = false;
  if(hi == false) {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }


  runApp(
    MaterialApp(
      title: 'My App',
      home: MainApp(), // Your custom stateful widget
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Transactions> _userTransactions = [];
  List<Transactions> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransactions(
    String txtitle,
    double txamount,
    DateTime dateSelected,
  ) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      amount: txamount,
      date: dateSelected,
      title: txtitle,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransation(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransactions(_addTransactions),
        );
      },
    );
  }

  void _deleteTransaaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  bool showChart = true;

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context);
    final inLandScap = mediaQ.orientation == Orientation.landscape;
    final appBarcup = CupertinoNavigationBar(
      middle: Text('hi ios'),
      trailing: CupertinoButton(
        onPressed: () => _startAddNewTransation(context),
        child: Icon(CupertinoIcons.add),
      ),
    );
    final appBarMat = AppBar(
      title: Text('hi'),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransation(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
    final PreferredSizeWidget appBar = Platform.isIOS ? appBarcup : appBarMat;

    final listWidget = SizedBox(
      height:
          (mediaQ.size.height -
              appBar.preferredSize.height -
              mediaQ.padding.top) *
          0.75,
      child: TransactionsList(_userTransactions, _deleteTransaaction),
    );
    final appBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (inLandScap)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("show chart", style: TextStyle(fontSize: 12)),
                  Switch.adaptive(
                    value: showChart,
                    onChanged: (val) => setState(() {
                      showChart = val;
                    }),
                  ),
                ],
              ),
            if (!inLandScap)
              SizedBox(
                height:
                    (mediaQ.size.height -
                        appBar.preferredSize.height -
                        mediaQ.padding.top) *
                    0.25,
                child: Chart(_recentTransactions),
              ),
            if (!inLandScap) listWidget,

            if (inLandScap)
              showChart == true
                  ? SizedBox(
                      height:
                          (mediaQ.size.height -
                              appBar.preferredSize.height -
                              mediaQ.padding.top) *
                          0.7,
                      child: Chart(_recentTransactions),
                    )
                  : listWidget,
          ],
        ),
      ),
    );
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle().copyWith(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          backgroundColor: Colors.amberAccent,
        ),
      ),

      home: Platform.isIOS
          ? CupertinoPageScaffold(navigationBar: appBarcup, child: appBody)
          : Scaffold(
              appBar: appBar,
              body: appBody,

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Platform.isIOS
                  ? SizedBox()
                  : FloatingActionButton(
                      onPressed: () => _startAddNewTransation(context),

                      child: Icon(Icons.add),
                    ),
            ),
    );
  }
}
