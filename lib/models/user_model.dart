class User {

  final int id;

  final String name;

  final String email;

  final String mobile;

  final String designation;

  final String department;

  final String photo;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.designation,
    required this.department,
    required this.photo,
  });

  factory User.fromJson(
      Map<String,dynamic> json) {

    return User(
      id: int.parse(
        json["id"].toString(),
      ),

      name:
      json["name"] ?? "",

      email:
      json["email"] ?? "",

      mobile:
      json["mobile"] ?? "",

      designation:
      json["designation"] ?? "",

      department:
      json["department"] ?? "",

      photo:
      json["photo"] ?? "",
    );
  }
}