class UserModel{
   String? email;
   String? name;
   String? phone;
   String? dateofBirth;
   String? password;
   String? profilePicture;

  UserModel({
     this.email,
     this.dateofBirth,
     this.name,
     this.phone,
     this.password,
     this.profilePicture
});

  Map<String,dynamic> toRegister(){
    return {
      'name' : name,
      'phone' : phone,
      'email' : email,
      'password' : password,
      'date_of_birth' : dateofBirth,
      'profile_picture': profilePicture,
    };
  }
  Map<String,dynamic> toLogin(){
    return {
      'email' : email,
      'password' : password,
    };
  }

}