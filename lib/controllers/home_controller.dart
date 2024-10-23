import 'package:chatting_app/Models/users_model.dart';
import 'package:chatting_app/core/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var users = <UsersModel>[].obs;

  RxBool isLoading = RxBool(false);

  @override
  onInit(){
    super.onInit();
    getUsers();
  }

  getUsers () async {
    isLoading.value = true;
    final response = await ApiServices.getUsers();
    isLoading.value = false;

    if(response.statusCode != 200){
      print(response.body);
      return;
    }

    users.value = usersModelFromJson(response.body);
    update();

  }
}