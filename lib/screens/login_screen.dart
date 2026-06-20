import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(){
    if(_formKey.currentState!.validate()){
      Navigator.push(context,
      MaterialPageRoute(builder: (_)=> HomeScreen(
        email :emailController.text,
      )
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40,),
              const Icon(Icons.lock),
              const SizedBox(height: 40,),

              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value== null || value.trim().isEmpty)
                    {
                      return "Email Required";
                    }
                  else if(!value.contains("@"))
                    {
                      return "Enter Valid email";

                    }
                  return null;

                },
              ),
              const SizedBox(height: 40,),
              TextFormField(
                controller: passwordController,

                obscureText: isPasswordHidden,

                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden?Icons.visibility:Icons.visibility_off
                    ),
                    onPressed: (){
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;

                      });
                    },
                  ),

                ),
                validator: (value){
                  if(value == null || value.isEmpty)
                    {
                      return "Password Required";
                    }
                  if(value.length<6)
                    {
                      return "Minimum 6 character";
                    }
                  return null;
                },
              ),
              const SizedBox(height: 40,),

              ElevatedButton(
                  onPressed: login,
                  child: Text(
                    "Login"
                  )
              ),

            ],
          ),

        ),
      ),
    );
  }
}
