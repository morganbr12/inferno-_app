import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import '../auth/auth_controllers/authMode.dart';

class ImagePickery extends StatefulWidget {
  const ImagePickery({Key? key}) : super(key: key);

  @override
  _ImagePickeryState createState() => _ImagePickeryState();
}

class _ImagePickeryState extends State<ImagePickery> {
  File? _profileImage;
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
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
                height: 98.h,
                width: 98.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
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
          onTap: _takePicture,
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
