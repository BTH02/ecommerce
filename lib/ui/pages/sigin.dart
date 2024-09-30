import 'package:ecommerce/ui/pages/createaccount.dart';
import 'package:ecommerce/ui/pages/verifycode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../routes/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text('Hi! Welcome back, you\'ve been missed'),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildInputEmail(),
            const SizedBox(
              height: 10,
            ),
            _buildInputPass(),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) =>const VerifyCode())),
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.brown,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.brown),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            _buildSignIn(),
            const SizedBox(height: 40,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  ),
                  const Text('Or sign in with'),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {

                  }, icon: Image.asset('images/facebook.png',height: 40,width: 40,)),
                  IconButton(onPressed: () {

                  }, icon: Image.asset('images/google.png',height: 40,width: 40,)),
                  IconButton(onPressed: () {

                  }, icon: Image.asset('images/twitter.png',height: 40,width: 40,)),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccount(),));
                }, child: const Text('Sign Up',style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,decorationColor: Colors.red),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInputEmail() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: const Column(
      children: [
        Row(
          children: [
            Text('Email'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'example@gmail.com',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputPass() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child:   Column(
      children: [
        const Row(
          children: [
            Text('Password'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {

              },
              icon: Image.asset('images/hidepass.png',width: 30,height: 30,),
            ),
            hintText: '**********',
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSignIn() {
  return Container(
    width: 330,
    height: 60,
    decoration: const BoxDecoration(color: Colors.brown,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30), left: Radius.circular(30))),
    child: const Center(
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
