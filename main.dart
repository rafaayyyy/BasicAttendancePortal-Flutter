import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Attendance Application BSCS20004'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> _selectedList = [false, false, false, false, false, false];

  Widget buildStudentRecord(String studentName, String studentRollNumber,
      double buttonHeight, int indexClicked) {
    return Container(
        height: MediaQuery.of(context).size.height * buttonHeight,
        color: Colors.transparent,
        child: Row(children: [
          Checkbox(
            checkColor: Colors.white,
            value: _selectedList[indexClicked],
            onChanged: (bool? newvalue) {
              setState(() {
                _selectedList[indexClicked] = newvalue!;
              });
            },
          ),
          Text(studentName,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const Expanded(
            child: Divider(),
          ),
          Text(studentRollNumber,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Table(
              children: [
                TableRow(children: [
                  buildStudentRecord(
                      "Muhammad Rafay Naeem", "BSCS20004", 0.1, 0),
                ]),
                TableRow(children: [
                  buildStudentRecord("Syed Samee Haider", "BSCS20001", 0.1, 1),
                ]),
                TableRow(children: [
                  buildStudentRecord("Sheikh Umer Khalid", "BSCS20002", 0.1, 2),
                ]),
                TableRow(children: [
                  buildStudentRecord(
                      "App Development 2022", "BSCS20000", 0.1, 3),
                ]),
                TableRow(children: [
                  buildStudentRecord("Clown Senpai uwu", "BSCS20060", 0.1, 4),
                ]),
                TableRow(children: [
                  buildStudentRecord(
                      "Red Dead Redemption", "BSCS20018", 0.1, 5),
                ]),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.transparent)),
              padding: const EdgeInsets.all(16.0),
            ),
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Attendance Submitted',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blueGrey,
                timeInSecForIosWeb: 2,
                textColor: Colors.black,
                fontSize: 16.0,
              );
            },
            child: const Text(
              "Submit",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
}
