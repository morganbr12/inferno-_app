import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:rename/rename.dart';
import '../auth/auth_controllers/authMode.dart';

class ImagePickery extends StatefulWidget {
  const ImagePickery({Key? key}) : super(key: key);

  @override
  _ImagePickeryState createState() => _ImagePickeryState();
}

class _ImagePickeryState extends State<ImagePickery> {
  File? _profileImage;
  User? user = FirebaseAuth.instance.currentUser;

  Auth authModel = Auth();

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {
      _profileImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    path.basename(imageFile!.path);
    final savedImage = imageFile.saveTo('${appDir.path}/$fileRepository');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profileImage == null
            ? Container(
                height: 98.h,
                width: 98.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor,
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 50.r,
                ),
              )
            : Container(
                height: 130.h,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(65),
                  color: Theme.of(context).accentColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _profileImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        SizedBox(
          height: 25.h,
        ),
        InkWell(
          onTap: () async {
            _takePicture();
            final ref = FirebaseStorage.instance
                .ref()
                .child('usersImages')
                .child(authModel.fullName! + '.jpg');
            await ref.putFile(_profileImage!);
            final url = await ref.getDownloadURL();
          },
          child: Text(
            'Upload Photo',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
