import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/model/bus_list_model.dart';

class BusBookingThreeSelectPage extends StatefulWidget {
  final Bus busSeat;
  const BusBookingThreeSelectPage({Key? key, required this.busSeat})
      : super(key: key);

  @override
  State<BusBookingThreeSelectPage> createState() => _BusBookingThreeSelectPageState();
}

class _BusBookingThreeSelectPageState extends State<BusBookingThreeSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.busSeat.name),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: Container(
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: darkColor, borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.busSeat.driverName,
                            style: const TextStyle(
                              fontSize: 22,
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.busSeat.driverLicenseNo,
                            style: const TextStyle(
                              fontSize: 16,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 20, 0, 0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/men.png',
                            height: 200,
                            width: 180,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(42.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      seatSelector(
                        '',
                        kColorBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          seatSelector('1', colorRed),
                          const Spacer(),
                          seatSelector('2', colorRed),
                          seatSelector('3', colorRed),
                          seatSelector('4', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('5', colorRed),
                          const Spacer(),
                          seatSelector('6', colorRed),
                          seatSelector('7', colorRed),
                          seatSelector('8', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('9', colorRed),
                          const Spacer(),
                          seatSelector('10', colorRed),
                          seatSelector('11', colorRed),
                          seatSelector('12', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('13', colorRed),
                          const Spacer(),
                          seatSelector('14', colorRed),
                          seatSelector('15', colorRed),
                          seatSelector('16', colorRed),
                          // _TakenSeatComponent(
                          //   marginRight: 16,
                          // ),
                          // _TakenSeatComponent(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('17', colorRed),
                          const Spacer(),
                          seatSelector('18', colorRed),
                          seatSelector('19', colorRed),
                          seatSelector('20', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('21', colorRed),
                          const Spacer(),
                          seatSelector('22', colorRed),
                          seatSelector('23', colorRed),
                          seatSelector('24', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('25', colorRed),
                          const Spacer(),
                          seatSelector('26', colorRed),
                          seatSelector('27', colorRed),
                          seatSelector('28', colorRed),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          seatSelector('29', colorRed),
                          const Spacer(),
                          seatSelector('30', colorRed),
                          seatSelector('31', colorRed),
                          seatSelector('32', colorRed),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container seatSelector(String? seatNum, Color? color) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          border: Border.all(
            color: color!,
            width: 3,
          ),
          color: color,
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Text(
          seatNum!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
