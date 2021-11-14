import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          width: _width,
          height: _height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _height * 0.35,
                  width: _width,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox(
                    width: _width,
                    height: _height * 0.6,
                    child: DefaultTabController(
                      length: 2,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: const Color(0xfff68554),
                                elevation: 8.0,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: _height * 0.07,
                                  width: _width * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                          )),
                                      Text(
                                        "Otcober 2021",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.0),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.05,
                                width: _width * 0.5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "SUN",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "MON",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "TUE",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "WED",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "THU",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "FRI",
                                      style: GoogleFonts.roboto(),
                                    ),
                                    Text(
                                      "SAT",
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.45,
                                width: _width * 0.5,
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
                          Expanded(
                              child: Container(
                            height: _height * 0.6,
                            width: _width,
                            color: Colors.orange,
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MonthCalender extends StatefulWidget {
  final double height;
  final double width;
  const MonthCalender({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<MonthCalender> createState() => _MonthCalenderState();
}

class _MonthCalenderState extends State<MonthCalender>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(15.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  @override
  Widget build(BuildContext context) {
    final int maxDate = DateTime.now().day;
    final double _height = widget.height;
    final double _width = widget.width;
    return SizedBox(
      height: _height * 0.8,
      width: _width * 0.05,
      child: GridView.count(
        crossAxisCount: 7,
        shrinkWrap: true,
        children: List.generate(32, (index) {
          return SlideTransition(
            position: _offsetAnimation,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Tooltip(
                message: AttendenceScreen.daysPresent.contains(index)
                    ? index + 1 > maxDate
                        ? "NA"
                        : "Absent"
                    : index + 1 > maxDate
                        ? "NA"
                        : "Present",
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: AttendenceScreen.daysPresent.contains(index)
                        ? index + 1 > maxDate
                            ? Colors.white
                            : const Color(0xfff68554)
                        : index + 1 > maxDate
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
                            ? index + 1 > maxDate
                                ? Color(0xff4c5c78)
                                : Colors.white
                            : index + 1 > maxDate
                                ? Color(0xff4c5c78)
                                : Colors.white,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          );
          ;
        }),
      ),
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
      width: width * 0.5,
      child: GridView.builder(
          itemCount: 7,
          cacheExtent: 9.0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Get.width > 1100.0 ? 7 : 5),
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
      elevation: 4.0,
      color: cardColor,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          height: _height * 0.1,
          width: _width * 0.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  color: const Color(0xffc3c6c6),
                  child: SizedBox(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Productive",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        )),
                    const Flexible(
                      child: Text("80%"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Productive Time",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        )),
                    const Text("4h 10m")
                  ],
                ),
              ),
              SizedBox(
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
