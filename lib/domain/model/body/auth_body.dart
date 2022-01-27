class AuthBody {
  String? email;
  String? password;
  String? mobile;
  String? gender;
  String? dob;
  String? firstName;
  String? lastName;
  String? userId;

  AuthBody(
      {this.email,
      this.password,
      this.mobile,
      this.gender,
      this.dob,
      this.firstName,
      this.lastName,
      this.userId});
}
