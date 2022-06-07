import 'package:budget_tracker_app/model/transaction_item.dart';
import 'package:budget_tracker_app/pages/home/components/add_transaction_dialog.dart';
import 'package:budget_tracker_app/pages/home/components/circular_percent.dart';
import 'package:budget_tracker_app/pages/home/components/transaction_card.dart';
import 'package:budget_tracker_app/services/budget_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    final budgetService = Provider.of<BudgetService>(
                      context,
                      listen: false,
                    );
                    budgetService.addItem(transactionItem);
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
                Consumer<BudgetService>(builder: ((context, value, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.items.length,
                      itemBuilder: (context, index) {
                        return TransactionCard(
                          item: value.items[index],
                        );
                      });
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
