import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  static const List<int> daysPresent = [
    1,
    3,
    2,
    8,
    3,
    5,
    9,
    12,
    14,
    16,
  ];

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen>
    with TickerProviderStateMixin {
  int maxDate = 0;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    for (var element in AttendenceScreen.daysPresent) {
      if (element > maxDate) {
        maxDate = element;
      }
    }
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final double _height = constraints.maxHeight;
      final double _width = constraints.maxWidth;
      return Scaffold(
        body: SizedBox(
          height: _height,
          width: _width,
          child: Row(
            children: [
              SizedBox(
                width: _width * 0.6,
                height: _height,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Working Productivity",
                          style: GoogleFonts.roboto(
                            fontSize: 32.0,
                          ),
                        ),
                      ),
                      CustomDayCards(
                        constraints: constraints,
                        cardColor: const Color(0xff4c5c78),
                        textColor: Colors.black54,
                      ),
                      CustomDayCards(
                        constraints: constraints,
                        cardColor: const Color(0xff4c5c78),
                        textColor: Colors.white70,
                      ),
                      CustomDayCards(
                        constraints: constraints,
                        cardColor: const Color(0xff4c5c78),
                        textColor: Colors.white70,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: _width * 0.6,
                          height: _height,
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: _height * 0.07,
                                      width: _width * 0.6,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Productivity in current month",
                                              style: GoogleFonts.roboto(
                                                fontSize: 22.0,
                                              ),
                                            ),
                                            Container(
                                              width: _width * 0.15,
                                              height: _height * 0.04,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff4c5c78),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)),
                                              child: TabBar(
                                                  indicator: BoxDecoration(
                                                      color: const Color(
                                                          0xfff68554),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  controller: _tabController,
                                                  tabs: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child:
                                                          const Text("Month"),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Text("Week"),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: _height * 0.45,
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        MonthCalender(
                                          height: _height,
                                          width: _width,
                                        ),
                                        WeekCalender(
                                          height: _height,
                                          width: _width,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height * 0.4,
                          width: _width,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: SizedBox(
                          height: _height,
                          width: _width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Mon 12 oct",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                    )),
                              ),
                              Card(
                                elevation: 8.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Expanded(
                                    child: Container(
                                      width: _width * 0.4,
                                      height: _height * 0.4,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MonthCalender extends StatelessWidget {
  final double height;
  final double width;
  const MonthCalender({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int maxDate = DateTime.now().day;
    final double _height = height;
    return SizedBox(
      height: _height * 0.45,
      child: GridView.builder(
          itemCount: 31,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9),
          itemBuilder: (_, index) {
            return Tooltip(
              message: AttendenceScreen.daysPresent.contains(index)
                  ? "Absent"
                  : index > maxDate
                      ? "NA"
                      : "Present",
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: AttendenceScreen.daysPresent.contains(index)
                      ? const Color(0xfff68554)
                      : index > maxDate
                          ? Colors.white
                          : const Color(0xff4c5c78),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(74.0),
                  ),
                  elevation: 4.0,
                  child: Center(
                      child: Text(
                    "${index + 1}",
                    style: GoogleFonts.roboto(
                      color: AttendenceScreen.daysPresent.contains(index)
                          ? Colors.white
                          : index > maxDate
                              ? Colors.black
                              : Colors.white,
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }
}

class WeekCalender extends StatelessWidget {
  final double height;
  final double width;
  const WeekCalender({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> attendenceList = [1, 3, 4];
    final int maxDate = DateTime.now().day;
    final double _height = height;
    return SizedBox(
      height: _height * 0.45,
      child: GridView.builder(
          itemCount: 7,
          cacheExtent: 9.0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9),
          itemBuilder: (_, index) {
            return Tooltip(
              margin: const EdgeInsets.all(4.0),
              message: AttendenceScreen.daysPresent.contains(index)
                  ? "Absent"
                  : index > maxDate
                      ? "NA"
                      : "Present",
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4.0,
                  color: attendenceList.contains(index)
                      ? const Color(0xfff68554)
                      : index > maxDate
                          ? Colors.white
                          : const Color(0xff4c5c78),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(74.0),
                  ),
                  child: Center(
                      child: Text(
                    "${index + 1}",
                    style: GoogleFonts.poppins(
                      color: AttendenceScreen.daysPresent.contains(index)
                          ? Colors.white
                          : index > maxDate
                              ? Colors.black
                              : Colors.white,
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }
}

class CustomDayCards extends StatelessWidget {
  final BoxConstraints constraints;
  final Color? cardColor;
  final Color textColor;

  const CustomDayCards(
      {Key? key,
      required this.constraints,
      required this.textColor,
      required this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = constraints.maxHeight;
    final double _width = constraints.maxWidth;
    return Card(
      elevation: 0.0,
      color: cardColor,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          height: _height * 0.1,
          width: _width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  color:const  Color(0xffc3c6c6),
                  child: SizedBox(
                    height: _height * 0.08,
                    width: _width * 0.08,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Mon"),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "18",
                            style: TextStyle(fontSize: 24.0),
                          ),
                        )),
                      ],
                    ),
                  )),
              SizedBox(
                height: _height * 0.08,
                width: _width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text("Productive",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            )),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Chip(
                        label: Flexible(
                          child: Text("80%"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.08,
                width: _width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text("Productive Time",
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ))),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Chip(label: Text("4h 10m")),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.08,
                width: _width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text("Time at work",
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ))),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Chip(label: Text("4h 10m")),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
