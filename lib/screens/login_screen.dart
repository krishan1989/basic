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

  bool isLoading = false;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async{
    if(!_formKey.currentState!.validate())
      {
        return;


      }
    setState(() {
      isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );
    const correctEmail = "admin@gmail.com";
    const correctPassword = "123456";

    String enteredEmail =
    emailController.text.trim();

    String enteredPassword =
    passwordController.text.trim();

    setState(() {
      isLoading = false;
    });

    if(enteredEmail == correctEmail && enteredPassword == correctPassword)
      {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login successfully"),),
          );
          Navigator.push(context, MaterialPageRoute(builder:
          (_)=> HomeScreen(email: enteredEmail),
          ));
      }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid Email or Password"))
        );
      }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy Login"),

        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40,),

              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 30,),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){

                  if(value==null || value.isEmpty)
                    {
                      return "Email required";

                    }
                  if(!value.contains("@"))
                    {
                      return "Enter Valid email";
                    }

                  return null;
                },
              ),

              const SizedBox(height: 20,),

              TextFormField(

                controller: passwordController,

                obscureText: isPasswordHidden,

                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden?Icons.visibility:Icons.visibility_off,
                      ),
                  ),
                ),
                validator: (value){
                  if(value == null){
                    return "Password require";
                  }
                  if(value.length < 6)
                    {
                      return "Minimum 6 characters";
                    }
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 20,
              child: ElevatedButton(

                  onPressed: isLoading?null:login,
                  child: Padding(
                    padding: const EdgeInsets.all(55.0),
                    child: isLoading?CircularProgressIndicator():Text("Login",style: TextStyle(fontSize: 45),),
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

