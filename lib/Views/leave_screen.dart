import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveFormScreen extends StatelessWidget {
  LeaveFormScreen({Key? key}) : super(key: key);

  final List<Widget> children = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LEAVE TYPE",
          style: GoogleFonts.poppins(),
        ),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  value: true,
                  groupValue: 1,
                  title: Text(
                    "LEAVE",
                    style: GoogleFonts.poppins(),
                  ),
                  onChanged: (onChanged) {}),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  value: false,
                  groupValue: 1,
                  title: Text(
                    "OPTIONAL",
                    style: GoogleFonts.poppins(),
                  ),
                  onChanged: (onChanged) {}),
            ),
          ],
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LEAVE TYPE",
          style: GoogleFonts.poppins(),
        ),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  value: true,
                  groupValue: 1,
                  title: Text(
                    "FIRST-HALF",
                    style: GoogleFonts.poppins(),
                  ),
                  onChanged: (onChanged) {}),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  value: false,
                  groupValue: 1,
                  title: Text(
                    "SECOND-HALF",
                    style: GoogleFonts.poppins(),
                  ),
                  onChanged: (onChanged) {}),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  value: false,
                  groupValue: 1,
                  title: Text(
                    "FULL-DAY",
                    style: GoogleFonts.poppins(),
                  ),
                  onChanged: (onChanged) {}),
            ),
          ],
        ),
      ],
    ),
  ];
  final List<Widget> mchildren = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LEAVE TYPE",
          style: GoogleFonts.poppins(fontSize: 14.0),
        ),
        SizedBox(
          height: 30,
          width: 200,
          child: RadioListTile(
              value: true,
              groupValue: 1,
              title: Text(
                "LEAVE",
                style: GoogleFonts.roboto(fontSize: 14.0),
              ),
              onChanged: (onChanged) {}),
        ),
        SizedBox(
          height: 30,
          width: 200,
          child: RadioListTile(
              value: false,
              groupValue: 1,
              title: Text(
                "OPTIONAL",
                style: GoogleFonts.roboto(fontSize: 14.0),
              ),
              onChanged: (onChanged) {}),
        ),
      ],
    ),
    SizedBox(
      height: 20.0,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DAY TYPE",
          style: GoogleFonts.poppins(),
        ),
        SizedBox(
          height: 30,
          width: 200,
          child: RadioListTile(
              value: true,
              groupValue: 1,
              title: Text(
                "FIRST-HALF",
                style: GoogleFonts.roboto(fontSize: 14.0),
              ),
              onChanged: (onChanged) {}),
        ),
        SizedBox(
          height: 30,
          width: 200,
          child: RadioListTile(
              value: false,
              groupValue: 1,
              title: Text(
                "SECOND-HALF",
                style: GoogleFonts.roboto(fontSize: 14.0),
              ),
              onChanged: (onChanged) {}),
        ),
        SizedBox(
          height: 30,
          width: 200,
          child: RadioListTile(
              activeColor: Colors.black87,
              toggleable: true,
              selected: true,
              value: false,
              groupValue: 1,
              title: Text(
                "FULL-DAY",
                style: GoogleFonts.roboto(fontSize: 14.0),
              ),
              onChanged: (onChanged) {}),
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints boxConstraints) {
      final double _height = boxConstraints.maxHeight;
      final double _width = boxConstraints.maxWidth;
      final bool _isMobile = _width <= 670.0;
      final bool _isTab = _width <= 980.0;
      return SizedBox(
        height: _height,
        width: _width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Apply for leave",
                style: GoogleFonts.roboto(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Text(
                "You have 7.5 days and 2 days optional in your account",
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: _height * 0.05,
              ),
              _isMobile || _isTab
                  ? Column(
                      children: mchildren,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children,
                    ),
              SizedBox(
                height: _height * 0.03,
              ),
              SizedBox(
                width: _width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FROM",
                          style: GoogleFonts.poppins(),
                        ),
                        SizedBox(
                          height: _height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: _width * 0.35,
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        DatePickerDialog(
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now(),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.grey[600],
                                      )),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TO",
                          style: GoogleFonts.poppins(),
                        ),
                        SizedBox(
                          height: _height * 0.01,
                        ),
                        SizedBox(
                          height: 100,
                          width: _width * 0.35,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 20.0),
                              suffixIcon: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    DatePickerDialog(
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.grey[600],
                                  )),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: _height * 0.02,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "REASON",
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  SizedBox(
                    width: _width * 0.8,
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "Type the reason for leave",
                        hintStyle: GoogleFonts.roboto(color: Colors.grey[500]),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _height * 0.02),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(BorderSide(
                        color: Color(0xff193498),
                        width: 1.0,
                      )),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(8.0),
                      ),
                    ),
                    child: Text(
                      "Cancle",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.1,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff193498),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(8.0),
                        ),
                      ),
                      child: Text(
                        "Apply Leave",
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).colorScheme.secondary),
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
