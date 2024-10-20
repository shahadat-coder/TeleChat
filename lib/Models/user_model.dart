class UserModel {
  late String? email;
  late String? name;
  late String? phone;
  late String? dateOfBirth;
  late String? password;
  late String? profilePicture;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.dateOfBirth,
    this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toRegister(){
    return{
      'name' : name,
      'phone' : phone,
      'password' : password,
      'dateOfBirth' : dateOfBirth,
      'email' : email,
      'profile_picture' : profilePicture,
    };
  }
  Map<String, dynamic> toLogIn(){
    return{
      'password' : password,
      'email' : email,
    };
  }
}