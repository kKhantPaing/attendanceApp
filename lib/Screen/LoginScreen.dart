import 'package:attendance_app/widget/PasswordTextField.dart';
import 'package:attendance_app/helper/DbHelper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = '', password = '';
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  var _LoginStatus = '';

  DbHelper dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Column(
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputField(
                              label: "Email", controller: _emailController),
                          inputField(
                              label: "Password",
                              controller: _passwordController,
                              secureText: true),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _LoginStatus,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            var result = await dbHelper.userLogin(
                                email: _emailController.text,
                                password: _passwordController.text);
                            switch (int.parse(result)) {
                              case -1:
                                _LoginStatus = 'Errors in login';
                                break;
                              case 0:
                                _LoginStatus = 'Wrong Email or Password';
                                break;
                              case > 0:
                                _LoginStatus = '';
                                break;
                            };
                          },
                          color: const Color(0xff0095ff),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputField({required label, required controller, secureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      secureText
          ? PasswordTextField(
              controller: controller,
            )
          : TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: (Colors.grey[400])!,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: (Colors.grey[400])!,
                    ),
                  )),
            ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
