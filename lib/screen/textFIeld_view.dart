import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ujiassigment/screen/listPersonal_view.dart';
import 'package:intl/intl.dart';

class TextFieldView extends StatefulWidget {
  TextFieldView({super.key});

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  bool? isChecked = false;
  bool? isPhoneInputed = false;
  bool? verifyClicked = false;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController personalIDController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> userDataList = [];

  @override
  void initState() {
    super.initState();

    // Listen to changes in the text field
    phoneController.addListener(() {
      // Render the view again
      setState(() {});
    });
  }

  void _showDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        dateController.text = DateFormat.yMMMd().format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'PERSONAL FORM',
          style: GoogleFonts.chivo(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListPersonalView(
                            userDataList: [],
                          )),
                );
              },
              child: Image(
                image: AssetImage('images/list.png'),
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! fullname
                Text('Full Name', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: fullnameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter Full Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //! Email
                Text('Email', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //! phone
                Text('Phone', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) / 1.5,
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon:
                              verifyClicked! && phoneController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {},
                                    )
                                  : null,
                          hintText: 'Enter You Phone Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: phoneController.text.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  verifyClicked = true;
                                });
                              },
                        child: Text('Verify'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 58),
                          elevation: 0.0,
                          alignment: Alignment.center,
                          foregroundColor: Color(0xff4A3DE5),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4.0), // Adjust the radius as needed
                            side: BorderSide(
                              color:
                                  Color(0xff4A3DE5), // Change the border color
                              width: 2.0, // Adjust the border width
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                //! Id Number
                Text('Personal ID Number', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: personalIDController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Personal ID Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //! Address
                Text('Address', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter You Address',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //! chose a Date
                Text('Chose a Date', textAlign: TextAlign.start),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Chose a Date',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Color(0xff4A3DE5),
                      onChanged: (newboolean) {
                        setState(() {
                          isChecked = newboolean;
                        });
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4A3DE5),
                    minimumSize: Size(MediaQuery.of(context).size.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          4.0), // Adjust the radius as needed
                    ),
                  ),
                  onPressed: isChecked!
                      ? () {
                          Map<String, dynamic> userData = {
                            'Full Name': fullnameController.text,
                            'Email': emailController.text,
                            'Phone': phoneController.text,
                            'Personal ID Number': personalIDController.text,
                            'Address': addressController.text,
                            'Date': dateController.text,
                          };
                          userDataList.add(userData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListPersonalView(
                                userDataList: userDataList,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
