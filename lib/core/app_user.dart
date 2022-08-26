class AppUser {
  final String uid;
  final String userName;
  final String lastName;
  final String email;
  final String phone;

  AppUser({
    required this.uid,
    required this.userName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory AppUser.fromJson(json) {
    //print("JSON FROM APPUSER CLASS : $json");
    return AppUser(
      uid: json['uid'],
      userName: json['userName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'uid': uid,
      'userName': userName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
}
