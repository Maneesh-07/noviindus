import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/ticketbooking/ticket_booking.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 90,
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff2B2B2B),
              child: Image.asset(
                'assets/image 1.png',
                height: 10,
                width: 10,
                scale: 2,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                      child: Container(
                        height: 220,
                        width: 185,
                        decoration: BoxDecoration(
                          color: colorRed,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bus',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Manage Your Bus',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    'assets/bus.png',
                                    height: 130,
                                    width: 200,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                      child: Container(
                        height: 220,
                        width: 185,
                        decoration: BoxDecoration(
                            color: colorRed,
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Driver',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Manage Your Driver',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    'assets/men.png',
                                    height: 150,
                                    width: 200,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kHeight20,
            Expanded(
                child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 47, 44, 44)
                          .withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ]),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/bus2.png',
                        height: 70,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('KSRTC'),
                          Text('Swift Scania P-series')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const BusBookingSelectPage(),
                            ));
                          },
                          style: TextButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width / 5, 40),
                            foregroundColor: kWhiteColor,
                            backgroundColor: colorRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Manage',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ))
          ],
        ),
      ),
    );
  }
}
