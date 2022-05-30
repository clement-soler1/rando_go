class User {
  final String imagePath;
  final String firstname;
  final String name;
  final String email;
  final String password;
  final String phonenumber;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    this.firstname = "firstname",
    this.password = "pwd",
    this.phonenumber = "00"
  });

  User.fromJson(Map<String, dynamic> json):
        imagePath = json['imagePath'],
        email = json['email'],
        firstname = json['firstname'],
        password = json['password'],
        name = json['name'],
        phonenumber = json['phonenumber'];

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'email': email,
      'firstname': firstname,
      'password': password,
      'name': name,
      'phonenumber': phonenumber,
    };
  }
}


