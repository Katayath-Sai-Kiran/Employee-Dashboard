import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/menu_screen.dart';
import 'package:employee_dashboard/Views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Consumer<IndexProvider>(builder: (context, indexProvider, _) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Row(
              children: [
                //navbar
                Container(
                  color: Colors.blueGrey[900],
                  width: constraints.maxWidth * 0.13,
                  height: constraints.maxHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: constraints.maxHeight * 0.1,
                          width: constraints.maxHeight * 0.1,
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        CustomIcons(
                          icon: Icons.home,
                          text: "Home",
                          cosntraints: constraints,
                          index: 0,
                        ),
                        CustomIcons(
                          text: "Profile",
                          cosntraints: constraints,
                          icon: Icons.account_circle_rounded,
                          index: 1,
                        ),
                        CustomIcons(
                          text: "Pay slips",
                          cosntraints: constraints,
                          icon: Icons.payments_outlined,
                          index: 2,
                        ),
                        CustomIcons(
                          text: "Leave Form",
                          cosntraints: constraints,
                          icon: Icons.message,
                          index: 3,
                        ),
                        CustomIcons(
                          text: "Complients",
                          icon: Icons.warning,
                          cosntraints: constraints,
                          index: 4,
                        ),
                        Text(constraints.constrainWidth().toString())
                      ],
                    ),
                  ),
                ),

                indexProvider.currentIndex == 0
                    ? ProfileScreen(
                        constraints: constraints,
                      )
                    : indexProvider.currentIndex == 1
                        ? ProfileScreen(
                            constraints: constraints,
                          )
                        : indexProvider.currentIndex == 2
                            ? ProfileScreen(
                                constraints: constraints,
                              )
                            : indexProvider.currentIndex == 3
                                ? ProfileScreen(
                                    constraints: constraints,
                                  )
                                : ProfileScreen(constraints: constraints)
              ],
            ),
          );
        });
      }),
    );
  }
}

nameCard({required BoxConstraints constraints}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: constraints.maxHeight * 0.3,
      width: constraints.maxWidth,
      child: Row(
        children: [
          CircleAvatar(
            minRadius: constraints.maxWidth * 0.05,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              size: constraints.maxWidth * 0.07,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Sai Kiran",
                style: TextStyle(
                  fontSize: 36.0,
                ),
              ),
              Text(
                "ksaikiran0407@gmail.com",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

addressCard({required BoxConstraints constraints}) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(34.0),
    height: constraints.maxHeight * 0.3,
    width: constraints.maxWidth,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Address",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("92937 Gusikowski Place Suite 076"),
              Text("North Cathrine"),
              Text("Bilzen"),
              Text("United states of america"),
              Text("92937 Gusikowski Place Suite 076"),
            ],
          ),
        )
      ],
    ),
  );
}

class CustomIcons extends StatelessWidget {
  final String text;
  final BoxConstraints cosntraints;
  final IconData icon;
  final int index;
  const CustomIcons({
    Key? key,
    required this.text,
    required this.index,
    required this.cosntraints,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isMobile = cosntraints.constrainWidth() <= 600;
    bool _isTab = cosntraints.constrainWidth() >= 600 &&
        cosntraints.constrainWidth() <= 1080;
    return Consumer<IndexProvider>(builder: (context, indexProvider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: _isMobile
            ? Card(
                color: indexProvider.currentIndex == index
                    ? Colors.yellow
                    : Colors.blueGrey[900],
                child: Tooltip(
                  message: text,
                  child: InkWell(
                    onTap: () {
                      indexProvider.updateCurrentIndex(updatedIndex: index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: indexProvider.currentIndex == index
                            ? Colors.black87
                            : Colors.white70,
                      ),
                    ),
                  ),
                ),
              )
            : _isTab
                ? Card(
                    color: indexProvider.currentIndex == index
                        ? Colors.yellow
                        : Colors.blueGrey[900],
                    child: InkWell(
                      onTap: () {
                        indexProvider.updateCurrentIndex(updatedIndex: index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              icon,
                              color: indexProvider.currentIndex == index
                                  ? Colors.black87
                                  : Colors.white70,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                  color: indexProvider.currentIndex == index
                                      ? Colors.black87
                                      : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      indexProvider.updateCurrentIndex(updatedIndex: index);
                    },
                    child: Card(
                      elevation: 0.0,
                      color: indexProvider.currentIndex == index
                          ? Colors.yellow
                          : Colors.blueGrey[900],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              color: indexProvider.currentIndex == index
                                  ? Colors.black87
                                  : Colors.white70,
                            ),
                            const SizedBox(
                              width: 24.0,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 100,
                              child: Flexible(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    color: indexProvider.currentIndex == index
                                        ? Colors.black87
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      );
    });
  }
}
