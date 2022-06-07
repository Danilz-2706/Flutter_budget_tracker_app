import 'package:budget_tracker_app/model/transaction_item.dart';
import 'package:budget_tracker_app/pages/home/components/add_transaction_dialog.dart';
import 'package:budget_tracker_app/pages/home/components/circular_percent.dart';
import 'package:budget_tracker_app/pages/home/components/transaction_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionItem> items = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTransactionDialog(
                  itemToAdd: (transactionItem) {
                    setState(() {
                      items.add(transactionItem);
                    });
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularPercent(screenSize: screenSize),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                    items.length,
                    (index) => TransactionCard(
                          item: items[index],
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
