import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime time = DateTime.now();
  bool isdigital = true;
  bool isanalog = false;
  bool isstrap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Stack(
            children: [
              //Digital clock
              Visibility(
                visible: isdigital,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("assets/image/dc.jpg"))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${time.hour}:${time.minute}:${time.second}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            "${time.day}/${time.month}/${time.year}",
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 6,
                      child: CircularProgressIndicator(
                          value: time.second / 60,
                          color: Colors.amber,
                          strokeCap: StrokeCap.round,
                          backgroundColor: Colors.white12),
                    ),
                  ],
                ),
              ),
              //Analog Clock
              Visibility(
                visible: isanalog,
                child: Stack(
                  children: List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: ((pi * 2) * index) / 60,
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        endIndent: index % 5 == 0
                            ? MediaQuery.sizeOf(context).width * 0.90
                            : MediaQuery.sizeOf(context).width * 0.95,
                      ),
                    ),
                  ),
                ),
              ),
              //Second
              Visibility(
                visible: isanalog,
                child: Transform.rotate(
                  angle: ((pi * 2) * time.second) / 60,
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Divider(
                      color: Colors.red,
                      thickness: 2,
                      endIndent: MediaQuery.sizeOf(context).width * 0.50,
                    ),
                  ),
                ),
              ),
              //Minute
              Visibility(
                visible: isanalog,
                child: Transform.rotate(
                  angle: ((pi * 2) * time.minute) / 60,
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Divider(
                      color: Colors.amber,
                      thickness: 2,
                      indent: 50,
                      endIndent: MediaQuery.sizeOf(context).width * 0.50,
                    ),
                  ),
                ),
              ),
              //Hour
              Visibility(
                visible: isanalog,
                child: Transform.rotate(
                  angle: ((pi * 2) * time.hour) / 12,
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Divider(
                      color: Colors.green,
                      thickness: 2,
                      indent: 80,
                      endIndent: MediaQuery.sizeOf(context).width * 0.50,
                    ),
                  ),
                ),
              ),

              //Strap Watch
              Visibility(
                visible: isstrap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff2068B0),
                                Color(0xff4A9BD4),
                                Color(0xff3081C0),
                              ]),
                          shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 5,
                            blurRadius: 3
                          ),
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${time.hour}:${time.minute}:${time.second}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            "${time.day}/${time.month}/${time.year}",
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    //Second
                    Container(
                      height: 250,
                      width: 250,
                      child: CircularProgressIndicator(
                        value: time.second * 1 / 60,
                        color: const Color(0xffFE7E03),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 19,
                      ),
                    ),
                    //Minute
                    Container(
                      height: 210,
                      width: 210,
                      child: CircularProgressIndicator(
                        value: time.minute / 60,
                        color: Colors.white,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 20,
                      ),
                    ),
                    //Hour
                    Container(
                      height: 170,
                      width: 170,
                      child: CircularProgressIndicator(
                        value: time.hour / 12,
                        color: const Color(0xff007C1E),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                  ),
                  const Text("Your Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  //Digital watch
                  Row(
                    children: [
                      //Digital Watch
                      const Text(
                        "Digital Watch",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isdigital = true;
                              isanalog = false;
                              isstrap = false;
                            });
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.watch_later_outlined))
                    ],
                  ),
                  const SizedBox(height: 10),
                  //Analog Clock
                  Row(
                    children: [
                      //Digital Watch
                      const Text(
                        "Analog Clock",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isdigital = false;
                              isanalog = true;
                              isstrap = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.watch_later_outlined))
                    ],
                  ),
                  const SizedBox(height: 10),
                  //Strap Watch
                  Row(
                    children: [
                      //Digital Watch
                      const Text(
                        "Strap Watch",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isdigital = false;
                              isanalog = false;
                              isstrap = true;
                            });
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.watch_later_outlined))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getTime() {
    setState(() {
      time = DateTime.now();
    });
    Future.delayed(const Duration(seconds: 1), () {
      getTime();
    });
  }
}
