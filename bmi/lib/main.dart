import 'package:bmi/show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int age = 10;
  double bimResult = 0.0;
  double hCurrentSliderValue = 90;
  double wCurrentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
    return SafeArea(
      child: Scaffold(
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
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            children: [
              Row(children: [
                male(),
                SizedBox(
                  width: 10.w,
                ),
                female()
              ]),
              SizedBox(
                height: screenHeight / 40,
              ),
              slider(),
              SizedBox(
                height: screenHeight / 40,
              ),
              row(screenWidth),
              SizedBox(height: screenHeight / 40),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      setState(() {
                        bimResult = wCurrentSliderValue *10000 / (hCurrentSliderValue * hCurrentSliderValue);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowResult( bmi: bimResult)),
                        );
                      });
                    });
                  },
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row row(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 130.h,
            color: const Color.fromARGB(255, 49, 71, 82),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("WEIGHT",
                  style: TextStyle(fontSize: 15.sp,
                    color: Colors.white,
                  )),
              Text("${wCurrentSliderValue.toInt()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    color: Color.fromARGB(255, 165, 28, 28),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        wCurrentSliderValue++;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 60,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        wCurrentSliderValue <= 1
                            ? wCurrentSliderValue = 1
                            : setState(() {
                                wCurrentSliderValue--;
                              });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.remove,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            height: 130.h,
            color: const Color.fromARGB(255, 49, 71, 82),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("AGE",
                  style: TextStyle(fontSize: 15.sp,
                    color: Colors.white,
                  )),
              Text("$age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    color: Color.fromARGB(255, 165, 28, 28),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        age++;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 60,
                  ),
                  InkWell(
                    onTap: () {
                      age <= 1
                          ? age = 1
                          : setState(() {
                              age--;
                            });
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.remove,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ],
    );
  }

  Expanded female() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: isMale == true
                  ? const Color.fromARGB(255, 49, 71, 82)
                  : Colors.red),
          height: 190.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.female,
                size: 75.sp,
                color: isMale == true ? Colors.grey : Colors.white,
              ),
              Text("FEMALE",
                  style: TextStyle(
                      color: isMale == true ? Colors.grey : Colors.white,
                      fontSize: 13.sp))
            ],
          ),
        ),
      ),
    );
  }

  Expanded male() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = true;
          });
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: isMale == true
                    ? Colors.red
                    : const Color.fromARGB(255, 49, 71, 82)),
            height: 190.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male,
                  size: 75.sp,
                  color: isMale == true ? Colors.white : Colors.grey,
                ),
                Text(
                  "MALE    ",
                  style: TextStyle(
                    color: isMale == true ? Colors.white : Colors.grey,
                    fontSize: 13.sp,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Container slider() {
    return Container(
      height: 170.h,
      color: const Color.fromARGB(255, 49, 71, 82),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Height (cm)",
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ),
          Text(
            "${hCurrentSliderValue.toInt()}",
            style: TextStyle(
                fontSize: 37.sp,fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 216, 8, 8)),
          ),
          Slider(
            value: hCurrentSliderValue,
            max: 200,
            min: 40,
            divisions: 150,
            activeColor: const Color.fromARGB(255, 206, 20, 7),
            onChanged: (value) {
              setState(() {
                hCurrentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
