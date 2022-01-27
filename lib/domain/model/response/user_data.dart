class UserData {
  String? email;
  String? mobile;
  String? gender;
  String? dob;
  String? firstName;
  String? lastName;
  String? userId;

  UserData(
      {this.email,
      this.mobile,
      this.gender,
      this.dob,
      this.firstName,
      this.lastName,
      this.userId});

  factory UserData.fromMap(dynamic map) {
    return UserData(
      firstName: map['fName'],
      lastName: map['lName'],
      email: map['email'],
      dob: map['dob'],
      gender: map['gender'],
      mobile: map['mobile'],
      userId: map['uid'],
    );
  }
}
