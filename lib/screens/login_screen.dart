import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  /// Email Controller
  final TextEditingController
  emailController =
  TextEditingController();

  /// Password Controller
  final TextEditingController
  passwordController =
  TextEditingController();

  /// Form Key
  final _formKey =
  GlobalKey<FormState>();

  /// Loading State
  bool isLoading = false;

  /// Password Hide/Show
  bool isPasswordHidden = true;

  @override
  void dispose() {

    /// Memory free karne ke liye
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  /// Login Function
  Future<void> login() async {

    /// Validation Check
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    try {

      setState(() {
        isLoading = true;
      });

      /// API Call
      final result =
      await AuthService.login(
        email:
        emailController.text
            .trim(),
        password:
        passwordController.text
            .trim(),
      );

      print(result);

      setState(() {
        isLoading = false;
      });

      /// Login Success
      if (result["status"] ==
          "success") {

        final userData =
        result["data"];

        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Login Successful",
            ),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                DashboardScreen(
                  userId: int.parse(
                    userData["id"]
                        .toString(),
                  ),
                ),
          ),
        );

      } else {

        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              result["message"] ??
                  "Login Failed",
            ),
          ),
        );
      }

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Error: $e",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text("Employee Login"),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              const SizedBox(
                height: 30,
              ),

              const Icon(
                Icons.person,
                size: 100,
              ),

              const SizedBox(
                height: 20,
              ),

              /// EMAIL
              TextFormField(

                controller:
                emailController,

                keyboardType:
                TextInputType
                    .emailAddress,

                decoration:
                const InputDecoration(
                  labelText: "Email",
                  border:
                  OutlineInputBorder(),
                  prefixIcon:
                  Icon(Icons.email),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return "Email Required";
                  }

                  if (!value.contains("@")) {
                    return "Enter Valid Email";
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 20,
              ),

              /// PASSWORD
              TextFormField(

                controller:
                passwordController,

                obscureText:
                isPasswordHidden,

                decoration:
                InputDecoration(

                  labelText:
                  "Password",

                  border:
                  const OutlineInputBorder(),

                  prefixIcon:
                  const Icon(
                      Icons.lock),

                  suffixIcon:
                  IconButton(

                    icon: Icon(

                      isPasswordHidden
                          ? Icons
                          .visibility
                          : Icons
                          .visibility_off,
                    ),

                    onPressed: () {

                      setState(() {
                        isPasswordHidden =
                        !isPasswordHidden;
                      });
                    },
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return "Password Required";
                  }

                  if (value.length < 6) {
                    return "Minimum 6 Characters";
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 30,
              ),

              SizedBox(

                width:
                double.infinity,

                child:
                ElevatedButton(

                  onPressed:
                  isLoading
                      ? null
                      : login,

                  child: Padding(

                    padding:
                    const EdgeInsets
                        .all(15),

                    child: isLoading

                        ? const SizedBox(
                      height: 25,
                      width: 25,
                      child:
                      CircularProgressIndicator(),
                    )

                        : const Text(
                      "LOGIN",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}