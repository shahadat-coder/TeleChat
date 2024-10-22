import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:chatting_app/utils/colors.dart';
import 'package:chatting_app/widgets/custom_button.dart';
import 'package:chatting_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => InkWell(
                      onTap: () => controller.pickImage(),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          image: controller.selectedImage.value.path == ''
                              ? null
                              : DecorationImage(
                                  image:
                                      FileImage(controller.selectedImage.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: 'Your name',
                    hintText: 'enter your name',
                    onChanged: (value) {
                      controller.userModel.value.name = value;
                    },
                  ),
                  const SizedBox(
                    height: 15,
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
                  CustomTextField(
                    label: 'Date of Birth',
                    hintText: 'yyyy-mm-dd',
                    onChanged: (value) {
                      controller.userModel.value.dateOfBirth = value;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Phone number',
                    hintText: 'enter your Phone number',
                    onChanged: (value) {
                      controller.userModel.value.phone = value;
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
                   Obx(()=> CustomButton(label: controller.isLoading.value ? 'Loading' : 'Sign Up',
                     onTap: ()=> controller.register(),
                   ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
