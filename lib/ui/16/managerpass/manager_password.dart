import 'package:ecommerce/shared/extensions/context_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingPassword extends StatefulWidget {
  const SettingPassword({super.key});

  @override
  State<SettingPassword> createState() => _SettingPasswordState();
}

class _SettingPasswordState extends State<SettingPassword> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() async {
    if (_formKey.currentState!.validate()) {
      String currentPassword = _currentPasswordController.text;
      String newPassword = _newPasswordController.text;

      try {
        // Thực hiện thay đổi mật khẩu
        await _reauthenticate(currentPassword);
        await _updatePassword(newPassword);
        context.showSnackBarInfo("Password updated successfully!");
      } catch (e) {
        context.showSnackBarError("Failed to update password: $e");
      }
    }
  }

  Future<void> _reauthenticate(String currentPassword) async {
    final user = FirebaseAuth.instance.currentUser!;
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);
  }

  Future<void> _updatePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.updatePassword(newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text('Quản lý mật khẩu'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _currentPasswordController,
                      decoration: const InputDecoration(
                          labelText: "Mật khẩu hiện tại",
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? "Nhập mật khẩu hiện tại"
                          : null,
                    ),
                    const Gap(10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red),
                        )
                      ],
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: const InputDecoration(
                          labelText: "Mật khẩu mới",
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: (value) => value != null && value.length >= 6
                          ? null
                          : "Mật khẩu ít nhất 6 kí tự",
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                          labelText: "Xác nhận lại mật khẩu",
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: (value) => value == _newPasswordController.text
                          ? null
                          : "Passwords do not match",
                    ),
                    const Gap(300),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _changePassword();
                            context
                                .showSnackBarInfo("Đổi mật khẩu thành công!");

                            _confirmPasswordController.clear();
                            _currentPasswordController.clear();
                            _newPasswordController.clear();
                          }
                        },
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20))),
                          child: const Center(
                            child: Text(
                              'Thay đổi mật khẩu',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
