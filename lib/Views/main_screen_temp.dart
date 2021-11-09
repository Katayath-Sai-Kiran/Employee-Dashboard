import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/attendence_screen.dart';
import 'package:employee_dashboard/Views/complients_screen.dart';
import 'package:employee_dashboard/Views/leave_screen.dart';
import 'package:employee_dashboard/Views/mobile/profile.dart';
import 'package:employee_dashboard/Views/pay_slips_screen.dart';
import 'package:employee_dashboard/Views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainScreen2 extends StatelessWidget {
  MainScreen2({Key? key}) : super(key: key);
  final List<Widget> destinations = [
    const ProfileScreen(),
    const AttendenceScreen(),
    const PlaySlipScreen(),
    const LeaveFormScreen(),
    const ComplientScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool _isMobile = Get.width <= 600;
    final double _height = Get.height;
    final double _width = Get.width;

    return _isMobile
        ? Scaffold(
            body: Container(
              height: _height,
              width: _width,
              child: Stack(children: [
                IndexedStack(
                  index: 0,
                  children: const [
                    MobileProfile(),
                  ],
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.blueGrey[900],
                      ),
                      margin: const EdgeInsets.all(16.0),
                      height: _height * 0.08,
                      width: _width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          InkWell(
                              child: Icon(Icons.account_circle_rounded,
                                  color: Colors.white)),
                          InkWell(
                              child: Icon(Icons.dashboard_rounded,
                                  color: Colors.white)),
                          InkWell(
                              child: Icon(Icons.message_rounded,
                                  color: Colors.white)),
                          InkWell(
                              child: Icon(Icons.label_important_rounded,
                                  color: Colors.white)),
                          InkWell(
                              child: Icon(Icons.security_rounded,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[900],
              title: Image.asset(
                "assets/logo.png",
                height: 42.0,
              ),
              centerTitle: true,
            ),
          )
        : Scaffold(
            body: Consumer(builder: (context, IndexProvider indexProvider, _) {
              return SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: LayoutBuilder(
                      builder: (context, BoxConstraints constrains) {
                    final double _height = constrains.constrainHeight();
                    final double _width = constrains.constrainWidth();

                    return Row(
                      children: [
                        Container(
                          color: Colors.blueGrey[900],
                          width: _width * 0.15,
                          height: _height,
                          child: Navbar(
                            constraints: constrains,
                          ),
                        ),
                        SizedBox(
                          width: _width * 0.85,
                          height: _height,
                          child: IndexedStack(
                            index: indexProvider.currentIndex,
                            children: destinations,
                          ),
                        )
                      ],
                    );
                  }));
            }),
          );
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

class Navbar extends StatelessWidget {
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
  final Color greyColor = Colors.grey;
  final BoxConstraints constraints;
  const Navbar({Key? key, required this.constraints}) : super(key: key);

  customMobileViewCard({required int selectedIndex, required String message}) {
    return Tooltip(
      preferBelow: true,
      verticalOffset: -10.0,
      message: message,
      child: Center(
        child: Icon(
          Icons.dashboard,
          color: selectedIndex == 0 ? blackColor : greyColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _height = constraints.constrainHeight();
    return Consumer<IndexProvider>(
        builder: (context, IndexProvider navIndexProvider, _) {
      final int selectedIndex = navIndexProvider.currentIndex;
      bool _isMobile = constraints.constrainWidth() <= 600;
      return _isMobile
          ? Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: _height * 0.1,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: constraints.maxHeight * 0.03),
                customMobileViewCard(
                    selectedIndex: selectedIndex, message: "Profile"),
                SizedBox(height: constraints.maxHeight * 0.03),
                customMobileViewCard(
                    selectedIndex: selectedIndex, message: "Attendence"),
                SizedBox(height: constraints.maxHeight * 0.03),
                customMobileViewCard(
                    selectedIndex: selectedIndex, message: "Pay Slips"),
                SizedBox(height: constraints.maxHeight * 0.03),
                customMobileViewCard(
                    selectedIndex: selectedIndex, message: "Leave Form"),
                SizedBox(height: constraints.maxHeight * 0.03),
                customMobileViewCard(
                    selectedIndex: selectedIndex, message: "Complaints"),
              ],
            )
          : Column(
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
                    iconColor: selectedIndex == 0 ? blackColor : greyColor,
                    constraints: constraints,
                    icon: Icons.dashboard,
                    textColor: selectedIndex == 0 ? blackColor : greyColor,
                    color: selectedIndex == 0 ? whiteColor : blackColor,
                    title: "Profile",
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                InkWell(
                  onTap: () {
                    navIndexProvider.updateCurrentIndex(updatedIndex: 1);
                  },
                  child: CustomCard(
                    iconColor: selectedIndex == 1 ? blackColor : greyColor,
                    constraints: constraints,
                    icon: Icons.message,
                    textColor: selectedIndex == 1 ? blackColor : greyColor,
                    color: selectedIndex == 1 ? whiteColor : blackColor,
                    title: "Attendence",
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                InkWell(
                  onTap: () {
                    navIndexProvider.updateCurrentIndex(updatedIndex: 2);
                  },
                  child: CustomCard(
                    iconColor: selectedIndex == 2 ? Colors.black : greyColor,
                    constraints: constraints,
                    icon: Icons.verified_user,
                    textColor: selectedIndex == 2 ? blackColor : greyColor,
                    color: selectedIndex == 2 ? whiteColor : blackColor,
                    title: "Pay Slips",
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                InkWell(
                  onTap: () {
                    navIndexProvider.updateCurrentIndex(updatedIndex: 3);
                  },
                  child: CustomCard(
                    iconColor: selectedIndex == 3 ? blackColor : greyColor,
                    constraints: constraints,
                    icon: Icons.payment,
                    textColor: selectedIndex == 3 ? blackColor : greyColor,
                    color: selectedIndex == 3 ? whiteColor : blackColor,
                    title: "Leave Form",
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                InkWell(
                  onTap: () {
                    navIndexProvider.updateCurrentIndex(updatedIndex: 4);
                  },
                  child: CustomCard(
                    iconColor: selectedIndex == 4 ? blackColor : greyColor,
                    constraints: constraints,
                    icon: Icons.dashboard,
                    textColor: selectedIndex == 4 ? blackColor : greyColor,
                    color: selectedIndex == 4 ? whiteColor : blackColor,
                    title: "Complient",
                  ),
                ),
              ],
            );
    });
  }
}

