
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:GoalChart/screen/Home_Page.dart';
import 'package:GoalChart/screen/Sign_up_page.dart';
import 'package:GoalChart/provider/Authprovider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void Login()async{
      try{
      User? success = await Provider.of<AuthPresenter>(context,listen: false).Signin(_emailController.text.trim(),_passwordController.text.trim());
      if (success != null) {
        Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Home_Page()));
      }
      }
      catch (e){
        
      }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String _error=Provider.of<AuthPresenter>(context,listen: false).error;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          height: 400,
          width: 350,
          margin: EdgeInsets.all(25),
          padding: EdgeInsetsDirectional.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 35),
              ),
              if (_error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.password)),
              ),
              ElevatedButton(
                  onPressed: () {
                    Login();
                    
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
