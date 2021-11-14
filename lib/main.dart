
import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/main_screen_temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:employee_dashboard/MobileViews/mobile_wrapper.dart';

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
        theme: ThemeData(
            primaryColor: const Color(0xff181D31),
            colorScheme: const ColorScheme(
              primary: Color(0xff181D31),
              primaryVariant: Color(0xff181D31),
              secondary: Color(0xffE6DDC4),
              secondaryVariant: Color(0xffF0E9D2),
              surface: Colors.white,
              background: Color(0xff181D31),
              error: Color(0xff181D31),
              onPrimary: Color(0xff181D31),
              onSecondary: Color(0xff181D31),
              onSurface: Color(0xff181D31),
              onBackground: Color(0xff181D31),
              onError: Color(0xff181D31),
              brightness: Brightness.light,
            )),
        title: "Employee dashboard",
        home: MainScreen2(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


// 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