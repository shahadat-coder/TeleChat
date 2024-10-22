import 'package:chatting_app/Models/user_model.dart';
import 'package:chatting_app/utils/endPoint.dart';
import 'package:http/http.dart' as http;


class ApiServices {
 static Future<http.StreamedResponse>register(UserModel data)async{
   final request = http.MultipartRequest("POST", ApiEndpoints.register);

   request.fields.addAll({
     'email' : data.email!,
     'phone' : data.phone!,
     'password' : data.password!,
     'name' : data.name!,
     'dateOfBirth' : data.dateOfBirth!,
   });
   request.files.add(
      await http.MultipartFile.fromPath(
          'profile_picture', data.profilePicture!),
    );
   request.headers.addAll({
     'Accept': 'application/json',
   });
  final response = await request.send();
  return response;
 }

 static Future<http.Response> login(UserModel data) async {
   return await http.post(ApiEndpoints.login,
     headers: {
        'Accept' : 'application',
     },
     body: data.toLogIn(),
   );

 }
}