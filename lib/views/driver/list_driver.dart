import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/services/driver_delete.dart';
import 'package:noviindus/services/driver_listing.dart';
import 'package:noviindus/views/driver/add_driver.dart';
import 'package:noviindus/views/driver/model/driver_model.dart';
import 'package:provider/provider.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<DriverProviderServices>(context);
    final deleteProvider = Provider.of<DriverDeletePostServices>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text('Driver'),
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: kWhiteColor,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
            ),
            backgroundColor: darkColor,
            elevation: 0,
            foregroundColor: kWhiteColor,
            centerTitle: true,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Driver Found',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            kHeight20,
            Expanded(
              child: StreamBuilder<List<Driver>>(
                stream: Stream.fromFuture(busProvider.fetchDriver()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                      child: Text('Failed to fetch booking details'),
                    );
                  } else {
                    List<Driver> busDetails = snapshot.data!;

                    return ListView.separated(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: busDetails.length,
                      itemBuilder: (context, index) {
                        final details = busDetails[index];
                        return Container(
                          decoration:
                              BoxDecoration(color: kWhiteColor, boxShadow: [
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
                              Image.asset('assets/men.png'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(details.name),
                                  Text(details.licenseNo)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: TextButton(
                                  onPressed: () {
                                    deleteProvider.sendDriverDetails(
                                        details.id.toString());
                                  },
                                  style: TextButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.sizeOf(context).width / 5,
                                        40),
                                    foregroundColor: kWhiteColor,
                                    backgroundColor: colorRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DriverAddingScreen(),
              ));
            },
            style: TextButton.styleFrom(
              fixedSize: Size(MediaQuery.sizeOf(context).width / 5, 70),
              foregroundColor: kWhiteColor,
              backgroundColor: colorRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Add Driver',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
