import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileWrapper extends StatelessWidget {
  const MobileWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        elevation: 8.0,
        child: SizedBox(
          height: _height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.dashboard),
              Icon(Icons.dashboard),
              Icon(Icons.dashboard),
              Icon(Icons.dashboard),
              Icon(Icons.dashboard),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: _height,
        width: _width,
        child: IndexedStack(
          index: 1,
          children: const [
            MobileProfile(),
            MobileProfile(),
            MobileProfile(),
            MobileProfile(),
            MobileProfile(),
          ],
        ),
      ),
    );
  }
}

class MobileProfile extends StatelessWidget {
  const MobileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: _height,
          width: _width,
          child: Stack(
            children: [
              AnimatedPositioned(
                child: Container(
                  child: Image.asset(
                    "assets/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                  height: _height * 0.4,
                  width: _width,
                  color: Colors.orange,
                ),
                duration: const Duration(seconds: 2),
              ),
              AnimatedPositioned(
                bottom: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0))),
                  height: _height * 0.6,
                  width: _width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),
                duration: Duration(seconds: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        leading: Container(
          height: 48.0,
          width: 48.0,
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            Icons.charging_station,
            color: Colors.deepPurple,
          ),
        ),
        title: Text(
          "Projects Done",
          style: GoogleFonts.roboto(),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
      ),
    );
  }
}
