import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';

class BusBookingSelectPage extends StatefulWidget {
  const BusBookingSelectPage({Key? key}) : super(key: key);

  @override
  State<BusBookingSelectPage> createState() => _BusBookingSelectPageState();
}

class _BusBookingSelectPageState extends State<BusBookingSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Select Seat"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        foregroundColor: Colors.black,
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
                            'License no: PJ515196161655',
                            style: TextStyle(
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
                          seatSelector('2', colorRed),
                          const Spacer(),
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
                          seatSelector('6', colorRed),
                          const Spacer(),
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
                          seatSelector('10', colorRed),
                          const Spacer(),
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
                          seatSelector('14', colorRed),
                          const Spacer(),
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
                          seatSelector('18', colorRed),
                          const Spacer(),
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
                          seatSelector('22', colorRed),
                          const Spacer(),
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
                          seatSelector('26', colorRed),
                          const Spacer(),
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
                          seatSelector('30', colorRed),
                          const Spacer(),
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

// class _TakenSeatComponent extends StatelessWidget {
//   const _TakenSeatComponent({
//     Key? key,
//     this.marginRight = 0.0,
//   }) : super(key: key);
//   final double? marginRight;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: marginRight ?? 0),
//       height: 48,
//       width: 48,
//       decoration: BoxDecoration(
//         color: Colors.grey[400]!,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: const Center(
//         child: Icon(
//           Icons.clear,
//         ),
//       ),
//     );
//   }
// }

