import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileProfile extends StatelessWidget {
  const MobileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SizedBox(
        height: _height,
        width: _width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _height * 0.2,
                color: Colors.orange,
              ),
              Container(
                height: _height * 0.7,
                width: _width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
