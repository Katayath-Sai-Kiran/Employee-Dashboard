import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplientScreen extends StatelessWidget {
  ComplientScreen({Key? key}) : super(key: key);
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    final double height = Get.height;
    final bool _isMobile = width <= 480.0;
    final bool _isTab = width >= 481.0 && width <= 770;
    return _isTab
        ? TabView()
        : Scaffold(
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[200],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      height: height * 0.4,
                      width: width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Previous Complaint Raised",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.grey[800],
                                    ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey[800]),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.9,
                          height: 50.0,
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: _bodyController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.0),
                                ),
                                //filled: true,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                fillColor: Colors.grey[200],
                              )),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Body",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.grey[800],
                                  ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.9,
                          child: TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: _subjectController,
                              enableSuggestions: true,
                              cursorColor: Colors.orange,
                              maxLines: 10,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.0)),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                fillColor: Colors.grey[200],
                              )),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey[900]),
                                ),
                                onPressed: () {
                                  _bodyController.clear();
                                  _subjectController.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.grey[900],
                                          behavior: SnackBarBehavior.floating,
                                          margin: const EdgeInsets.all(16.0),
                                          content: Container(
                                            height: height * 0.1,
                                            width: width * 0.4,
                                            color: Colors.grey[900],
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.done_outline_outlined,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        "Successfully Submitted complient")),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: SizedBox(),
                                                ),
                                              ],
                                            ),
                                          )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Submit",
                                    style:
                                        GoogleFonts.roboto(letterSpacing: 1.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Center(
                            child: Text(
                              "Successfully Submitted complient",
                              style: GoogleFonts.roboto(
                                letterSpacing: 1.0,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  final List complients = [
    "Internet Connection",
    "Timings",
    "Parking",
    "Internet Connection",
    "Timings",
    "Parking",
    "Internet Connection",
    "Timings",
    "Parking",
  ];
}

class TabView extends StatelessWidget {
  TabView({Key? key}) : super(key: key);
  final List complients = [
    "Internet Connection",
    "Timings",
    "Parking",
    "Internet Connection",
    "Timings",
    "Parking",
    "Internet Connection",
    "Timings",
    "Parking",
  ];

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _width = Get.width;
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: _width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Previous Complaint Raised",
                        style: GoogleFonts.roboto(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30.0,
                        child: Center(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            strutStyle: StrutStyle(
                              forceStrutHeight: true,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(24.0)))),
                          ),
                        ),
                        width: 200,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0)),
                  height: _height * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        padding: EdgeInsets.only(bottom: _height * 0.05),
                        itemCount: complients.length,
                        semanticChildCount: 2,
                        physics: RangeMaintainingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 5.0, crossAxisCount: 2),
                        itemBuilder: (_, index) {
                          return SizedBox(
                            height: _height * 0.08,
                            child: Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.green,
                                        size: 18.0,
                                      ),
                                    ),
                                    Text(
                                      complients[index],
                                      style: GoogleFonts.roboto(
                                          letterSpacing: 1.0),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.grey[500],
                                          size: 18.0,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: _height * 0.8,
                  width: _width,
                  //       color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apply for leave",
                        style: GoogleFonts.aBeeZee(fontSize: 18.0),
                      ),
                      SizedBox(height: _height * 0.01),
                      Text(
                        "You have 5.5 and 1 optional leaves in your account",
                        style: GoogleFonts.roboto(fontSize: 14.0),
                      ),
                      SizedBox(height: _height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "LEAVE TYPE",
                                style: GoogleFonts.poppins(fontSize: 16.0),
                              ),
                            ],
                          ),
                          Text(
                            "DAY TYPE",
                            style: GoogleFonts.poppins(fontSize: 16.0),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
