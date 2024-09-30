import 'package:ecommerce/ui/pages/newpass.dart';
import 'package:flutter/material.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text('Verify Code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text('Please enter the code we just sent to email'),
              const Text('example@gmail.com'),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNumberCode(),
                  _buildNumberCode(),
                  _buildNumberCode(),
                  _buildNumberCode()
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Didn\'t receive OTP?'),
              const Text('Resend code',
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red)),
              const SizedBox(
                height: 40,
              ),
              const buildVerify(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildNumberCode() {
  return Container(
    width: 60,
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(60), right: Radius.circular(60))),
    child: Center(
      child: Container(
        width: 15,
        height: 15,
        child: TextField(),
      ),
    ),
  );
}

class buildVerify extends StatelessWidget {
  const buildVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewPass(),
          )),
      child: Container(
        width: 330,
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        child: const Center(
          child: Text(
            'Verify',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
