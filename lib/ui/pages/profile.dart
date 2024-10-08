import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60,),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Center(
                child: Text(
                  'Complete Your Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  Text('Don\'t worry, only you can see your personal data'),
                  Text('No one else will be able to see it')
                ],
              ),
              SizedBox(
                height: 170,
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 170,
                        height: 170,
                        child: Image.asset('images/avata.png'),
                      ),
                      Positioned(
                        top: 110,
                        left: 110,
                        width: 30,
                        height: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2,color: Colors.black),
                            borderRadius: const BorderRadius.all(Radius.circular(40)),),
                          child: Image.asset('images/penedit.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildNameProfile(),
              _buildPhoneProfile(),
              _buildGenderProfile(),
              const SizedBox(
                height: 30,
              ),
              _buildComplete(),
            ],
          ),
        ));
  }
}

Widget _buildNameProfile() {
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

Widget _buildPhoneProfile() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      children: [
        const Row(
          children: [
            Text('Phone Number'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 15),
              child: DropdownButton<String>(
                underline: Container(
                  color: Colors.white,
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                value: '+1',
                items: <String>['+1', '+2', '+3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {},
              ),
            ),
            hintText: '|  Enter Phone Number',
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
          ),
        ),
      ],
    ),
  );
}

Widget _buildGenderProfile() {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: const Column(
      children: [
        Row(
          children: [
            Text('Gender'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.keyboard_arrow_down),
            hintText: 'Select',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
          ),
        ),
      ],
    ),
  );
}

Widget _buildComplete() {
  return Container(
    width: 330,
    height: 60,
    decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30), left: Radius.circular(30))),
    child: const Center(
      child: Text(
        'Complete Profile',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
