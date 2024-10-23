import 'package:chatting_app/core/services/shared_services.dart';


Future<String> authToken () async {
  final token = await SharedServices.getData(SetType.string, 'token');

  return 'Bearer $token';
}