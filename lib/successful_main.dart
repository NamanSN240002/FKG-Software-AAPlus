import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recommender_app/utilities/apiservices.dart';
import 'package:recommender_app/tab_page.dart';

void main() {
  runApp(const Login());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.orange.shade100,
          indicatorColor: Colors.orange.shade700,
        ),
      ),
      home: const TabPage(),
    );
  }
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
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.medical_services,
                size: 42,
                color: Colors.cyan,
              ),
              const Text(
                "MEDICOS",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
              const SizedBox(height: 30),
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
                      Navigator.pushReplacementNamed(context, '/home');
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
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Login'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text("Dont have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text("Register!")),
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
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.medical_services,
                size: 42,
                color: Colors.cyan,
              ),
              const Text(
                "MEDICOS",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: userSsnController,
                decoration: const InputDecoration(hintText: 'Email'),
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
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: companyController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(hintText: 'Name'),
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
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Sign Up'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text("Login!")),
            ],
          ),
        ),
      ),
    );
  }
}
