import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/services/post_driver.dart';
import 'package:noviindus/views/driver/list_driver.dart';
import 'package:noviindus/widgets/textformwidget.dart';
import 'package:provider/provider.dart';

class DriverAddingScreen extends StatefulWidget {
  const DriverAddingScreen({super.key});

  @override
  State<DriverAddingScreen> createState() => _DriverAddingScreenState();
}

class _DriverAddingScreenState extends State<DriverAddingScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController licenseNoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    licenseNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final driverAddingProvider = Provider.of<DriverPostServices>(context);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              TextFormWidget(
                labelText: 'Name',
                controller: nameController,
                height: 70,
                width: MediaQuery.sizeOf(context).width / 1.1,
                inputType: TextInputType.name,
              ),
              kHeight20,
              TextFormWidget(
                controller: phoneController,
                labelText: 'PhoneNo',
                maxLine: 10,
                height: 70,
                width: MediaQuery.sizeOf(context).width / 1.1,
                inputType: TextInputType.phone,
              ),
              kHeight20,
              TextFormWidget(
                controller: licenseNoController,
                labelText: 'licenseNo',
                height: 70,
                width: MediaQuery.sizeOf(context).width / 1.1,
                inputType: TextInputType.name,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            onPressed: () {
              try {
                driverAddingProvider.sendDriverDetails(nameController.text,
                    phoneController.text, licenseNoController.text);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const DriverScreen(),
                ));
              } catch (e) {
                print('Failed to send$e');
              }
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
              'Save',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
