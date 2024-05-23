import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/controllers/auth_controller.dart';
import 'package:telechat/custom_widget/custom_text_field.dart';
import 'package:telechat/custom_widget/cutom_button.dart';
import 'package:telechat/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'Sign Up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    onTap: () => controller.pickImage(),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          image: controller.selectedImage.value.path == ''
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                      controller.selectedImage.value),fit: BoxFit.cover)),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomField(
                  label: ' Full Name',
                  hintText: 'Enter your Name',
                  onChanged: (value) {
                    controller.userModel.value.name = value;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                CustomField(
                  label: 'Phone Number',
                  hintText: 'Enter your Phone Number',
                  onChanged: (value) {
                    controller.userModel.value.phone = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  label: 'Date of Birth',
                  hintText: 'yyyy-mm-dd',
                  onChanged: (value) {
                    controller.userModel.value.dateofBirth = value;
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
                        controller.isSecured.value =
                            !controller.isSecured.value;
                      },
                      icon: Icon(controller.isSecured.value == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'Log In',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
