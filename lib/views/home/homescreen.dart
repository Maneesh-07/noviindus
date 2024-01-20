import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/model/bus_list_model.dart';
import 'package:noviindus/services/bus_listing.dart';
import 'package:noviindus/services/login_service.dart';
import 'package:noviindus/views/auth/login.dart';
import 'package:noviindus/views/driver/list_driver.dart';
import 'package:noviindus/views/ticketbooking/three_seat.dart';
import 'package:noviindus/views/ticketbooking/ticket_booking.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<BusProviderServices>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 90,
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff2B2B2B),
              child: Row(
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  Image.asset(
                    'assets/image 1.png',
                    height: 80,
                    width: 100,
                    scale: 2,
                  ),
                  const SizedBox(
                    width: 110,
                  ),
                  IconButton(
                      onPressed: () {
                        _showLogoutConfirmationDialog(context);
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: kWhiteColor,
                      ))
                ],
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DriverScreen(),
                          ));
                        },
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
                                padding:
                                    const EdgeInsets.fromLTRB(50, 20, 0, 0),
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
                    ),
                  ],
                ),
              ],
            ),
            kHeight20,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buses Found',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Bus>>(
                      future: busProvider.fetchBus(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError || snapshot.data == null) {
                          return const Center(
                            child: Text('Failed to fetch booking details'),
                          );
                        } else {
                          List<Bus> busDetails = snapshot.data!;

                          return ListView.separated(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: busDetails.length,
                            itemBuilder: (context, index) {
                              final details = busDetails[index];
                              return Container(
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 47, 44, 44)
                                            .withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 1,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]),
                                height: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CachedNetworkImage(
                                        color: kColorBlack,
                                        imageUrl:
                                            'https://flutter-api.noviindus.in${details.image}',
                                        imageBuilder: (context,
                                                imageProvider) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  height: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                      color: kColorBlack,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  height: double.maxFinite,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: whiteColor,
                                                  ),
                                                  child:
                                                      const CupertinoActivityIndicator(),
                                                ),
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  height: double.maxFinite,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: bgColor,
                                                  ),
                                                  child: Icon(
                                                    Icons.error,
                                                    color: whiteColor
                                                        .withOpacity(0.9),
                                                  ),
                                                ),
                                              ),
                                            )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(details.name),
                                        Text(details.type)
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          if (details.id == 8 ||
                                              details.id == 12 ||
                                              details.id == 13) {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  BusBookingSelectPage(
                                                busSeat: details,
                                              ),
                                            ));
                                          } else {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  BusBookingThreeSelectPage(
                                                busSeat: details,
                                              ),
                                            ));
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.sizeOf(context).width /
                                                  5,
                                              40),
                                          foregroundColor: kWhiteColor,
                                          backgroundColor: colorRed,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final loginProvider = Provider.of<AuthServices>(context);
        return AlertDialog(
          title: Text(
            'Logout',
            style: TextStyle(),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: TextStyle(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(),
              ),
            ),
            TextButton(
              onPressed: () {
                loginProvider.logOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              child: Text(
                'Logout',
                style: TextStyle(),
              ),
            ),
          ],
        );
      },
    );
  }
}
