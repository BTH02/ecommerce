import 'package:flutter/material.dart';
class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(50))
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'New Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Text('Your new password must be different'),
              Text('from previously used password.')
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          _buildInputNewPass(),
          const SizedBox(height: 30,),
          _buildInputConfirmPass(),
          const SizedBox(height: 50,),
          _buildNewPass(),
        ],
      ),
    );
  }
}
Widget _buildInputNewPass() {
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
Widget _buildInputConfirmPass() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      children: [
        const Row(
          children: [
            Text('Confirm Password'),
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

Widget _buildNewPass() {
  return Container(
    width: 330,
    height: 60,
    decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30), left: Radius.circular(30))),
    child: const Center(
      child: Text(
        'Create New Password',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}