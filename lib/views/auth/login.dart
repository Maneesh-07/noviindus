import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/services/login_service.dart';
import 'package:noviindus/views/home/homescreen.dart';
import 'package:noviindus/widgets/textformwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

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
              controller: userName,
              height: 70,
              width: MediaQuery.sizeOf(context).width / 1.1,
              inputType: TextInputType.emailAddress,
            ),
            kHeight20,
            TextFormWidget(
              controller: password,
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
                try {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final login = await loginProvider.sendAuth(
                      userName.text, password.text);
                  if (login == 'Login success') {
                    print('token ${sharedPreferences.get('access_token')}');
                    Fluttertoast.showToast(
                      msg: 'Welcome ${sharedPreferences.get('displayName')}.',
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                    );
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Login failed. Please try again.',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: colorGrey);
                  }
                } catch (e) {
                  print('Error booking product: $e');
                }
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
