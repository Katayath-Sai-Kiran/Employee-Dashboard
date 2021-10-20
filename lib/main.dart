import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/main_screen_temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const WrapperScreen());
}

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IndexProvider()),
      ],
      child: GetMaterialApp(
        title: "Employee dashboard",
        home: MainScreen2(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
