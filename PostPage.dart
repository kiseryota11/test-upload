import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          (imageUrl != null) ? Image.network(imageUrl) : Placeholder(fallbackHeight: 200.0, fallbackWidth: double.infinity),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text('Add Post'),
            onPressed: () async {
              final _storage = FirebaseStorage.instance;
              final _picker = ImagePicker();
              PickedFile image;

              //Check Permissions
              await Permission.photos.request();

              var permissionStatus = await Permission.photos.status;

              if (permissionStatus.isGranted) {
                //Select Image
                image = await _picker.getImage(source: ImageSource.gallery);
                var file = File(image.path);

                if (image != null) {
                  //Upload to Firebase
                  var snapshot = await _storage.ref().child('folderName/imageName').putFile(file).onComplete;

                  var downloadUrl = await snapshot.ref.getDownloadURL();

                  setState(() {
                    imageUrl = downloadUrl;
                  });
                } else {
                  print('No Path Received');
                }
              } else {
                print('Grant Permissions and try again');
              }
            },
          ),
        ],
      ),
    );
  }
}
