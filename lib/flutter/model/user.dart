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
}
