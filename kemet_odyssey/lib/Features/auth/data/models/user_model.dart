class UserModel {
  final String id;
  final String? name;
  final String? phone;
  final String? email;
  final String? country;
  final String? imageUrl;

  UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.country,
      required this.imageUrl});
}
