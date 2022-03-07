import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/auth_controllers/authMode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManagementServices {
  updateProfilePic(picUrl) {
    var userInfo = Auth();
    userInfo.photoUrl = picUrl;

    FirebaseAuth _auths = FirebaseAuth.instance;

    _auths.userChanges();
  }

  final storage = const FlutterSecureStorage();

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(
      key: 'token',
      value: userCredential.credential!.token.toString(),
    );
    await storage.write(
      key: 'userCredential',
      value: userCredential.toString(),
    );
  }
}
