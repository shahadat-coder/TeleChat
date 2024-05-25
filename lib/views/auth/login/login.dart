import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/controllers/auth_controller.dart';
import 'package:telechat/custom_widget/custom_text_field.dart';
import 'package:telechat/custom_widget/cutom_button.dart';
import 'package:telechat/utils/colors.dart';
import 'package:telechat/views/auth/register/register.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 100,
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
                'Please enter your details to continue with your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomField(
                label: 'Email Address',
                hintText: 'Enter your email address',
                onChanged: (value) {
                  controller.userModel.value.email = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CustomField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  onChanged: (value) {
                    controller.userModel.value.password = value;
                  },
                  isSecured: controller.isSecured.value,
                  trailing: IconButton(
                    onPressed: () {
                      controller.isSecured.value = !controller.isSecured.value;
                    },
                    icon: Icon(controller.isSecured.value == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() => CustomButton(
                label: controller.isLoading.value ? 'Loading...' : 'Log In',
                onTap: ()=> controller.login(),
              ),),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: Text(
                    'CREATE A NEW ACCOUNT',
                    style: TextStyle(
                        color: AppColors.primary.withOpacity(.5),
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
