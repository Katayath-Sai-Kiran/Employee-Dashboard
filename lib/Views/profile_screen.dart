import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final BoxConstraints constraints;
  const ProfileScreen({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.4,
                child: Center(
                  child: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.blueGrey[900],
                    size: constraints.maxWidth * 0.15,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth,
                child: Center(
                  child: Column(
                    children: [
                      customDetailCard(
                          constraints: constraints,
                          icon: Icons.logout,
                          text: ""),
                      customDetailCard(
                          constraints: constraints,
                          icon: Icons.logout,
                          text: ""),
                      customDetailCard(
                          constraints: constraints,
                          icon: Icons.logout,
                          text: ""),
                      customDetailCard(
                          constraints: constraints,
                          icon: Icons.logout,
                          text: ""),
                      customDetailCard(
                          constraints: constraints,
                          icon: Icons.logout,
                          text: "Logout"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  customDetailCard(
      {required BoxConstraints constraints,
      required String text,
      required IconData icon}) {
    return Card(
      elevation: 4.0,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(text),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(onPressed: () {}, icon: Icon(icon)),
            ),
          ],
        ),
        width: constraints.maxWidth * 0.5,
      ),
    );
  }
}
