import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/attendence_screen.dart';
import 'package:employee_dashboard/Views/complients_screen.dart';
import 'package:employee_dashboard/Views/leave_screen.dart';
import 'package:employee_dashboard/Views/pay_slips_screen.dart';
import 'package:employee_dashboard/Views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> destinations = [
    const ProfileScreen(),
    const AttendenceScreen(),
    const PlaySlipScreen(),
    LeaveFormScreen(),
    ComplientScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Container(
          color: Colors.blue,
        );
      }),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final double _height = constraints.constrainHeight();
      final double _width = constraints.constrainWidth();
      return Container(
        width: _width * 0.15,
        height: _height,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomCardsList(
            constraints: constraints,
          ),
        ),
      );
    });
  }
}

class CustomCardsList extends StatelessWidget {
  final BoxConstraints constraints;
  const CustomCardsList({Key? key, required this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = constraints.constrainHeight();
    return Consumer<IndexProvider>(
        builder: (context, IndexProvider navIndexProvider, _) {
      final int selectedIndex = navIndexProvider.currentIndex;
      return Column(
        children: [
          Image.asset(
            "assets/logo.png",
            height: _height * 0.1,
            fit: BoxFit.cover,
          ),
          SizedBox(height: constraints.maxHeight * 0.02),
          InkWell(
            onTap: () {
              navIndexProvider.updateCurrentIndex(updatedIndex: 0);
            },
            child: CustomCard(
              iconColor: selectedIndex == 0 ? Colors.black : Colors.grey,
              constraints: constraints,
              icon: Icons.dashboard,
              textColor: selectedIndex == 0 ? Colors.black : Colors.grey,
              color: selectedIndex == 0 ? Colors.yellow : Colors.black,
              title: "Profile",
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
          InkWell(
            onTap: () {
              navIndexProvider.updateCurrentIndex(updatedIndex: 1);
            },
            child: CustomCard(
              iconColor: selectedIndex == 1 ? Colors.black : Colors.grey,
              constraints: constraints,
              icon: Icons.message,
              textColor: selectedIndex == 1 ? Colors.black : Colors.grey,
              color: selectedIndex == 1 ? Colors.yellow : Colors.black,
              title: "Attendence",
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
          InkWell(
            onTap: () {
              navIndexProvider.updateCurrentIndex(updatedIndex: 2);
            },
            child: CustomCard(
              iconColor: selectedIndex == 2 ? Colors.black : Colors.grey,
              constraints: constraints,
              icon: Icons.verified_user,
              textColor: selectedIndex == 2 ? Colors.black : Colors.grey,
              color: selectedIndex == 2 ? Colors.yellow : Colors.black,
              title: "Pay Slips",
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
          InkWell(
            onTap: () {
              navIndexProvider.updateCurrentIndex(updatedIndex: 3);
            },
            child: CustomCard(
              iconColor: selectedIndex == 3 ? Colors.black : Colors.grey,
              constraints: constraints,
              icon: Icons.payment,
              textColor: selectedIndex == 3 ? Colors.black : Colors.grey,
              color: selectedIndex == 3 ? Colors.yellow : Colors.black,
              title: "Leave Form",
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
          InkWell(
            onTap: () {
              navIndexProvider.updateCurrentIndex(updatedIndex: 4);
            },
            child: CustomCard(
              iconColor: selectedIndex == 4 ? Colors.black : Colors.grey,
              constraints: constraints,
              icon: Icons.dashboard,
              textColor: selectedIndex == 4 ? Colors.black : Colors.grey,
              color: selectedIndex == 4 ? Colors.yellow : Colors.black,
              title: "Complient",
            ),
          ),
        ],
      );
    });
  }
}

class CustomCard extends StatelessWidget {
  final Color color;
  final BoxConstraints constraints;
  final String title;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  const CustomCard({
    Key? key,
    required final this.color,
    required final this.constraints,
    required final this.icon,
    required final this.title,
    required final this.textColor,
    required final this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: SizedBox(
        height: constraints.maxHeight * 0.05,
        width: constraints.maxWidth * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.05,
              width: constraints.maxWidth * 0.03,
              child: Center(
                  child: Icon(
                icon,
                color: iconColor,
              )),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
              width: constraints.maxWidth * 0.08,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            ),
            const Text(""),
          ],
        ),
      ),
    );
  }
}
