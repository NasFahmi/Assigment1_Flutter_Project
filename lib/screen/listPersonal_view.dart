import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ujiassigment/screen/textFIeld_view.dart';

class ListPersonalView extends StatelessWidget {
  final List<Map<String, dynamic>> userDataList;
  ListPersonalView({required this.userDataList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'List Personal Data',
          style: GoogleFonts.chivo(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.builder(
            itemCount: userDataList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userDataList[index]['Full Name']}',
                        style: GoogleFonts.chivo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${userDataList[index]['Email']}',
                        style: GoogleFonts.chivo(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4A3DE5),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${userDataList[index]['Address']}',
                        style: GoogleFonts.chivo(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
