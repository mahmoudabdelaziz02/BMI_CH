import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowResult extends StatefulWidget {
  ShowResult({required this.bmi});
  final double? bmi;

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 54),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 6, 41),
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(children: [
          Text("The Result",
              style: TextStyle(color: Colors.white, fontSize: 30.sp)),
          SizedBox(
            height: screenHeight / 40,
          ),
          Container(
            height: 480.h,
            width: double.infinity,
            color: const Color.fromARGB(255, 49, 71, 82),
            child: Column(children: [
              Text("${widget.bmi!.toInt()}",
                  style: TextStyle(fontSize: 70.sp, color: Colors.white)),
              SizedBox(
                height: screenHeight / 20,
              ),
              state()
            ]),
          ),
          SizedBox(
            height: screenHeight / 40,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                });
              },
              child: Container(
                color: Colors.red,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "RETRY",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Text state() {
    if (widget.bmi! < 16) {
      return Text("Severe Thinness",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 16 && widget.bmi! <= 17) {
      return Text("Moderate Thinness",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 17 && widget.bmi! <= 18.5) {
      return Text("Mild Thinness",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 18.5 && widget.bmi! <= 25) {
      return Text("Normal",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 25 && widget.bmi! <= 30) {
      return Text("Overweight",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 30 && widget.bmi! <= 35) {
      return Text("Obese Class I",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! >= 35 && widget.bmi! <= 40) {
      return Text("Obese Class II",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else {
      return Text("Obese Class III",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    }
  }

  Text comment() {
    if (widget.bmi! < 16) {
      return Text("Severe Thinness",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    }
    // else if (widget.bmi! >= 16 || widget.bmi! <= 17) {
    //   return Text("Moderate Thinness",
    //       style: TextStyle(fontSize: 30.sp, color: Colors.white));
    // }
    else if (widget.bmi! > 17 || widget.bmi! <= 18.5) {
      return Text("Mild Thinness",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! > 18.5 || widget.bmi! <= 25) {
      return Text("Normal",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! > 25 || widget.bmi! <= 30) {
      return Text("Overweight",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! > 30 || widget.bmi! <= 35) {
      return Text("Obese Class I",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else if (widget.bmi! > 35 || widget.bmi! <= 40) {
      return Text("Obese Class II",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    } else {
      return Text("Obese Class III",
          style: TextStyle(fontSize: 30.sp, color: Colors.white));
    }
  }
}
