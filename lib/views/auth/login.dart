import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/views/home/homescreen.dart';
import 'package:noviindus/widgets/textformwidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff2B2B2B),
              height: MediaQuery.sizeOf(context).height / 3,
              child: Image.asset('assets/Frame 3.png'),
            ),
            kHeight20,
            TextFormWidget(
              labelText: 'username',
              height: 70,
              width: MediaQuery.sizeOf(context).width / 1.1,
              inputType: TextInputType.emailAddress,
            ),
            kHeight20,
            TextFormWidget(
              labelText: 'password',
              height: 70,
              width: MediaQuery.sizeOf(context).width / 1.1,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 300,
            ),
            TextButton(
              onPressed: () async {
                // try {
                //   // Send the product data to the backend
                //   await apiServices.postProduct(
                //     product.id,
                //     quantity,
                //   );

                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //         backgroundColor: Colors.white,
                //         duration: const Duration(seconds: 3),
                //         content: bottombar()),
                //   );

                // } catch (e) {
                //   print('Error booking product: $e');
                // }
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              style: TextButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width / 1.1, 60),
                foregroundColor: kWhiteColor,
                backgroundColor: colorRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
