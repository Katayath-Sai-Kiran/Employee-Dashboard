import 'package:employee_dashboard/Providers/index_provider.dart';
import 'package:employee_dashboard/Views/attendence_screen.dart';
import 'package:employee_dashboard/Views/complients_screen.dart';
import 'package:employee_dashboard/Views/home_screen.dart';
import 'package:employee_dashboard/Views/leave_screen.dart';
import 'package:employee_dashboard/Views/pay_slips_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double _height = constraints.maxHeight;
      final double _width = constraints.maxWidth;
      return DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          body: SizedBox(
            height: _height,
            width: _width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
                //   height: _height * 0.08,
                //   width: _width,
                //   color: Theme.of(context).primaryColor,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Image.asset(
                //         "assets/logo.png",
                //         height: _height * 0.07,
                //         fit: BoxFit.cover,
                //       ),
                //       Row(
                //         children: [
                //           menuItem(index: 0, text: "Home", context: context),
                //           menuItem(
                //               index: 1, text: "Attendence", context: context),
                //           menuItem(
                //               index: 2, text: "Pay Slips", context: context),
                //           menuItem(
                //               index: 3, text: "Leave Form", context: context),
                //           menuItem(
                //               index: 4, text: "Complaints", context: context),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  color: Theme.of(context).colorScheme.primary,
                  height: _height * 0.08,
                  width: _width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: _height * 0.1,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.all(4.0),
                          height: _height * 0.07,
                          width: _width * 0.7,
                          child: TabBar(
                            onTap: (index) {
                              Provider.of<IndexProvider>(context, listen: false)
                                  .updateCurrentIndex(updatedIndex: index);
                            },
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.orange,
                            ),
                            controller: tabController,
                            tabs: [
                              menuItem(
                                  index: 0, text: "Home", context: context),
                              menuItem(
                                  index: 1,
                                  text: "Attendence",
                                  context: context),
                              menuItem(
                                  index: 2,
                                  text: "Pay Slips",
                                  context: context),
                              menuItem(
                                  index: 3,
                                  text: "Leave Form",
                                  context: context),
                              menuItem(
                                  index: 4,
                                  text: "Complaints",
                                  context: context),
                            ],
                          ),
                        ),
                        CircleAvatar(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: _height * 0.9,
                    width: _width,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        const ProfileScreen(),
                        const PlaySlipScreen(),
                        const PlaySlipScreen(),
                        const PlaySlipScreen(),
                        const PlaySlipScreen(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget menuItem(
      {required String text,
      required BuildContext context,
      required int index}) {
    IndexProvider indexProvider =
        Provider.of<IndexProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: indexProvider.currentIndex == index
              ? Theme.of(context).colorScheme.primary.withOpacity(0.9)
              : Theme.of(context).colorScheme.primary.withOpacity(0.9),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: LayoutBuilder(builder: (_, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;
        return SizedBox(
          height: height,
          width: width,
          child: Column(),
          
        );
      }),
    );
  }
}
