import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                ),
                const SizedBox(
                  width: 100,
                ),
                const Text('Cài đặt'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const _BuildSettings(
                icon: Icons.person, text: 'Thông báo'),
            _BuildSettings(
              icon: Icons.key,
              text: 'Quản lý mật khẩu',
              onTap: () => Navigator.pushNamed(context, Routes.settingPass),
            ),
            _BuildSettings(
              icon: Icons.person,
              text: 'Xóa tài khoản',
              onTap: () => Navigator.pushNamed(context, Routes.deleteAccount),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildSettings extends StatelessWidget {
  const _BuildSettings({required this.icon, required this.text, this.onTap});

  final IconData icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Icon(
                      icon,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(onPressed: onTap, child: Text(text))
                ],
              ),
              const Icon(Icons.arrow_forward_ios_sharp)
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          )
        ],
      ),
    );
  }
}
