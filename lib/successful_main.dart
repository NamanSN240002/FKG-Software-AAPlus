import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recommender_app/utilities/apiservices.dart';
import './welcome_page_1.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userSsn = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Color(0xff23272C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_checkout,
                    size: 42,
                    color: Color(0xff23272C),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "GRIDKART",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff23272C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              TextFormField(
                controller: userSsn,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  LoginApi log = LoginApi(
                      userSsn: userSsn.text.toString(),
                      password: passwordController.text.toString());
                  await log.tryLogin();
                  if (log.res.statusCode == 200) {
                    var ret = jsonDecode(log.res.body);
                    if (ret["Status"] == "Error") {
                      var emsg = ret["msg"];
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(emsg)));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: WelcomePage1(user: ret['user'])));
                    }
                  } else {
                    var info_ = jsonDecode(log.res.body);
                    var emsg = info_['custom'];
                    return emsg;
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text("Dont have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Register()));
                  },
                  child: const Text(
                    "Register!",
                    style: TextStyle(color: Colors.black87),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userSsnController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Color(0xff23272C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_checkout,
                    size: 42,
                    color: Color(0xff23272C),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "GRIDKART",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff23272C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: userSsnController,
                decoration: const InputDecoration(hintText: 'SSN'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: sexController,
                decoration: const InputDecoration(hintText: 'Sex'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(hintText: 'Job'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: companyController,
                decoration: const InputDecoration(hintText: 'Company'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(hintText: 'Date of Birth'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  RegisterApi registerApi = RegisterApi(
                      userSsn: userSsnController.text.toString(),
                      name: nameController.text.toString(),
                      sex: sexController.text.toString(),
                      job: jobController.text.toString(),
                      company: companyController.text.toString(),
                      dob: dobController.text.toString(),
                      password: passwordController.text.toString());
                  await registerApi.tryRegister();
                  if (registerApi.ret["Status"] == "Error") {
                    var emsg = registerApi.ret["msg"];
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(emsg)));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child:
                                WelcomePage1(user: registerApi.ret["output"])));
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Login()));
                  },
                  child: const Text(
                    "Login!",
                    style: TextStyle(color: Colors.black87),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
