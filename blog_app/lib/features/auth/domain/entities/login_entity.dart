// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequestEntity {
  final String email;
  final String password;

  LoginRequestEntity({required this.email, required this.password});
}

class LoginResponseEntity {
  final String token;
  final String userId;
  final String email;
  final String password;
  final String fullName;
  final String bio;
  final String expertise;
  final String image;
  final String imageCloudinaryPublicId;

  LoginResponseEntity({
    required this.token,
    required this.userId,
    required this.email,
    required this.password,
    required this.fullName,
    required this.bio,
    required this.expertise,
    required this.image,
    required this.imageCloudinaryPublicId,
  });
}
