class Auth {
  String? uid;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? photoUrl;

  Auth({
    this.uid,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.photoUrl,
  });

  // receiving data from server

  factory Auth.fromMap(map) {
    return Auth(
        uid: map['uid'],
        email: map['email'],
        fullName: map['fullName'],
        phoneNumber: map['phoneNumber'],
        photoUrl: map['photoUrl']);
  }

  // sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      "email": email,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      'photoUrl': photoUrl,
    };
  }
}
