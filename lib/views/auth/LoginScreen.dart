import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/utils/colors.dart';
import 'package:chatting_app/views/auth/register_screen.dart';
import 'package:chatting_app/widgets/custom_button.dart';
import 'package:chatting_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SafeArea(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Please enter your details to continue with account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'enter your email address',
                  onChanged: (value) {
                    controller.userModel.value.email = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => CustomTextField(
                    label: 'Password',
                    hintText: 'enter your password',
                    onChanged: (value) {
                      controller.userModel.value.password = value;
                    },
                    isSecured: controller.isSecured.value,
                    trailing: IconButton(
                        onPressed: () {
                          controller.isSecured.value =
                              !controller.isSecured.value;
                        },
                        icon: Icon(controller.isSecured.value == true
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomButton(label: 'LogIn'),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () => Get.to(() => const RegisterScreen()),
                    child: Text(
                      'CREATE A NEW ACCOUNT',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary.withOpacity(0.5)),
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
