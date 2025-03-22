class ProfileGetEntity {
  final String name;
  final String email;
  final String password;
  final String imageurl;

  ProfileGetEntity(
      {required this.imageurl,
      required this.name,
      required this.email,
      required this.password});
}
