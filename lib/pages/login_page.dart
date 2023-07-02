import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/model/login_model.dart';
import 'package:flutter_ecommerce/service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginService loginService = LoginService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login? loginUser;

  String username = "";
  String password = "";

  @override
  void initState() {
    // loginService.loginRequest();
    super.initState();
  }

  // Retrieve the arguments
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        controller: usernameController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        controller: passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.green),
                        onPressed: () {
                          username = usernameController.text;
                          password = passwordController.text;

                          setState(() {
                            loginService
                                .loginRequest(username, password)
                                .then((value) => loginUser = value);
                            if (loginUser == null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Login failed'),
                                    content: const Text(
                                        'The username or password is incorrect!'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // debugPrint(loginUser!.email.toString());
                              Navigator.pushNamed(
                                context,
                                '/tabbar_widget',
                                arguments: {'user': loginUser},
                              );
                            }
                          });
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
