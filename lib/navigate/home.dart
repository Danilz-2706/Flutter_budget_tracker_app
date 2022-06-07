import 'package:budget_tracker_app/navigate/components/add_budget_dialog.dart';
import 'package:budget_tracker_app/pages/home/home_page.dart';
import 'package:budget_tracker_app/pages/profile/profile_page.dart';
import 'package:budget_tracker_app/services/budget_service.dart';
import 'package:budget_tracker_app/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddBudgetDialog(
                        budgetToAdd: (budget) {
                          final budgetsService = Provider.of<BudgetService>(
                            context,
                            listen: false,
                          );
                          budgetsService.budget = budget;
                        },
                      );
                    });
              },
              icon: const Icon(Icons.attach_money))
        ],
        leading: IconButton(
          onPressed: () {
            themeService.darkmode = !themeService.darkmode;
          },
          icon: Icon(themeService.darkmode ? Icons.sunny : Icons.dark_mode),
        ),
      ),
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: bottomNavItems,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
