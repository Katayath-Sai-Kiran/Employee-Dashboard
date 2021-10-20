import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        final double _height = Get.height;
        final double _width = Get.width;
        return Column(
          children: [
            SizedBox(
              height: Get.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const EmployeeDetailsCard(),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Expanded(
                        child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const PersonalDetailsCard(),
                          SizedBox(width: _width * 0.05),
                          Expanded(
                            child: SizedBox(
                              width: _width * 0.6,
                              height: _height,
                              child: const ProjectDetailsCard(),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: _height * 0.2,
              width: _width,
              color: Colors.orange,
            )
          ],
        );
      }),
    );
  }
}

class EmployeeDetailsCard extends StatelessWidget {
  const EmployeeDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return SizedBox(
      height: _height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                height: _height * 0.17,
                width: 200,
                color: Colors.blueGrey[900],
                child: Image.asset("assets/logo.png"),
              ),
            ),
            const SizedBox(
              width: 18.0,
            ),
            SizedBox(
              height: _height * 0.17,
              width: _width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "K Sai Kiran",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Flutter Developer",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "wielabs Tech products and Services",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Hyderabad",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height * 0.17,
              width: _width * 0.3,
              child: Column(
                children: [
                  SizedBox(
                    height: _height * 0.05,
                    child: ListTile(
                      leading: Icon(
                        Icons.email_rounded,
                        color: Colors.blueGrey[900],
                      ),
                      title: Text(
                        "ksaikiran0407@gmail.com",
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.05,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone_rounded,
                        color: Colors.blueGrey[900],
                      ),
                      title: Text(
                        "+91 9110518247",
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return SizedBox(
      width: _width * 0.3,
      height: _height,
      // color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Presonal Details",
                  style: GoogleFonts.poppins(
                    fontSize: 22.0,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_rounded,
                      size: 24.0,
                    ))
              ],
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            const CustomDetailCard(
              heading1: "Gender",
              heading2: "Date of birth",
              subHeading1: "Male",
              subHeading2: "28 july 1998",
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            const CustomDetailCard(
              heading1: "Blood group",
              heading2: "Registered email",
              subHeading1: "b+",
              subHeading2: "ksaikiran0407@gmail.com",
            ),
            SizedBox(
              height: _height * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Permanent Address",
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "4-A banjara hills road no 12",
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Resident Address",
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "4-A banjara hills road no 12",
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDetailCard extends StatelessWidget {
  final String heading1;
  final String heading2;
  final String subHeading1;
  final String subHeading2;
  const CustomDetailCard({
    Key? key,
    required this.heading1,
    required this.heading2,
    required this.subHeading1,
    required this.subHeading2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading1,
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 8.0),
            Text(
              subHeading1,
              style: GoogleFonts.poppins().copyWith(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading2,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 8.0),
              Text(
                subHeading2,
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectDetailsCard extends StatefulWidget {
  const ProjectDetailsCard({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsCard> createState() => _ProjectDetailsCardState();
}

class _ProjectDetailsCardState extends State<ProjectDetailsCard>
    with TickerProviderStateMixin {
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(() {
      setState(() {
        index = tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SizedBox(
        width: _width * 0.7,
        height: _height,
        // color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Project Details",
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.2,
                    height: _height * 0.05,
                    child: TabBar(
                      enableFeedback: false,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.blueGrey[900],
                      ),
                      tabs: [
                        Text(
                          "Current",
                          style: GoogleFonts.poppins(
                              color: index == 0 ? Colors.white : Colors.black),
                        ),
                        Text(
                          "All",
                          style: GoogleFonts.poppins(
                              color: index == 1 ? Colors.white : Colors.black),
                        ),
                      ],
                      controller: tabController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: const [
                          ProjectCard(
                            icon: Icons.lock_clock_outlined,
                            percentage: "87%",
                            title: "Clock 365",
                          ),
                          ProjectCard(
                            icon: Icons.flip,
                            percentage: "30%",
                            title: "Demo Project",
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                          children: List.generate(
                              10,
                              (index) => const ProjectCard(
                                    icon: Icons.lock_clock_outlined,
                                    percentage: "87%",
                                    title: "Clock 365",
                                  ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String percentage;
  const ProjectCard({
    Key? key,
    required this.icon,
    required this.percentage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: _height * 0.08,
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              Icon(
                icon,
                color: Colors.pink,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                title,
                style: GoogleFonts.roboto(),
              ),
              const Spacer(),
              Text(
                "$percentage Completed",
                style: GoogleFonts.roboto(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
