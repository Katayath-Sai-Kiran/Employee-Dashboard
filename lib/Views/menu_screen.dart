import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            children: [
              Container(
                color: Colors.blueGrey[900],
                height: constraints.maxHeight,
                width: constraints.maxWidth * 0.3,
                child: const Center(
                  child: Divider(
                    color: Colors.red,
                    thickness: 2.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey[900],
                  child: ListWheelScrollView(
                      perspective: 0.01,
                      diameterRatio: 1,
                      itemExtent: 50,
                      children: const [
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 54.0,
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                color: Colors.blueGrey[900],
                height: constraints.maxHeight,
                width: constraints.maxWidth * 0.3,
                child: const Center(
                  child: Divider(
                    color: Colors.red,
                    thickness: 2.0,
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
