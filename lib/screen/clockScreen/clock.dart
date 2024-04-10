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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Clock"),
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
                      height: 260,
                      width: 260,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          const Text("Loe Angeles",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15
                            ),),
                          const Text("84°F",style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),),
                          const Divider(
                            indent: 40,
                            endIndent: 40,
                            thickness: 2,
                            color: Colors.blue,
                          ),
                          Text("${time.hour}:${time.minute}:${time.second}",
                            style: const TextStyle(
                                fontSize: 45,
                                color: Colors.white
                            ),),
                          Text("date: ${time.day}/${time.month}/${time.year}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.blue
                            ),
                          ),
                          const Divider(
                            indent: 40,
                            endIndent: 40,
                            thickness: 2,
                            color: Colors.blue,
                          ),
                          const Text("Distance : 9.50km",
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                         const Text("Calories :2,956",
                            style: TextStyle(
                                color: Colors.white
                            ),)
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 7.5,
                      child: CircularProgressIndicator(
                          value: time.second / 60,
                          color: Colors.blue,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          backgroundColor: Colors.white12),
                    ),
                  ],
                ),
              ),
              //Analog Clock
              Visibility(
                visible: isanalog,
                  child: Center(
                      child: Image.asset("assets/image/poster2.png",height: 250,))),
              Visibility(
                visible: isanalog,
                child: Center(
                  child: Stack(
                    children: List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: ((pi * 2) * index) / 60,
                        child: Divider(
                          color: Colors.black,
                          thickness: 3,
                          endIndent: index%5==0
                                     ?MediaQuery.sizeOf(context).width * 0.90
                                     :MediaQuery.sizeOf(context).width * 0.95
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Second
              Visibility(
                visible: isanalog,
                child: Center(
                  child: Transform.rotate(
                    angle: ((pi * 2) * time.second) / 60,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        color: Colors.red,
                        thickness: 3.5,
                        endIndent: MediaQuery.sizeOf(context).width * 0.50,
                      ),
                    ),
                  ),
                ),
              ),
              //Minute
              Visibility(
                visible: isanalog,
                child: Center(
                  child: Transform.rotate(
                    angle: ((pi * 2) * time.minute) / 60,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        color: Colors.amber,
                        thickness: 3.5,
                        indent: 50,
                        endIndent: MediaQuery.sizeOf(context).width * 0.50,
                      ),
                    ),
                  ),
                ),
              ),
              //Hour
              Visibility(
                visible: isanalog,
                child: Center(
                  child: Transform.rotate(
                    angle: ((pi * 2) * time.hour) / 12,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        color: Colors.green,
                        thickness: 3.5,
                        indent: 80,
                        endIndent: MediaQuery.sizeOf(context).width * 0.50,
                      ),
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
                          child: const Icon(Icons.watch_later_outlined))
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
                          child: const Icon(Icons.watch_later_outlined))
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
