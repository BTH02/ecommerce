import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'Create Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Text('Fill your information below or register'),
              Text('with your social account')
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          _buildNameCreate(),
          _buildInputEmailCreate(),
          _buildInputPassCreate(),
          Row(
            children: [
              Checkbox(
                value: true,
                activeColor: Colors.brown,
                onChanged: (value) {},
              ),
              const Text('Agree with'),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Term & Condition',
                style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red),
              ),
            ],
          ),
          _buildSignUp(),
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/facebook.png',
                      height: 40,
                      width: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/google.png',
                      height: 40,
                      width: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/twitter.png',
                      height: 40,
                      width: 40,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context,Routes.signIn),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                  ))
            ],
          ),
        ],
      )),
    );
  }
}

Widget _buildNameCreate() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: const Column(
      children: [
        Row(
          children: [
            Text('Name'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'John Doe',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputEmailCreate() {
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

Widget _buildInputPassCreate() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
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
              onPressed: () {},
              icon: Image.asset(
                'images/hidepass.png',
                width: 30,
                height: 30,
              ),
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

Widget _buildSignUp() {
  return Container(
    width: 330,
    height: 60,
    decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30), left: Radius.circular(30))),
    child: const Center(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
