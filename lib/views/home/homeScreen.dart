import 'package:chatting_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return ListTile(
                    title: Text(user.name!),
                    subtitle: Text(user.email!),
                    trailing: const Icon(Icons.access_time_filled),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePicture!),
                  )
                  );
                },
                itemCount: controller.users.length);
          }
        }));
  }
}
