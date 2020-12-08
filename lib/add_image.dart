import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


// THIS FILE IS NO LONGER USED FOR DISPLAYING IMAGE
//VIEW ADDING_IMAGE.dart to see upload of image
class AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCapture(),
    );
  }

}

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // Active image file
  File _imageFile;

  // Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      //ratioX: 1.0,
      //  ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
      //toolbarColor: Colors.purple,
      // toolbarWidgetColor: Colors.white,
      // toolbarTitle: 'Crop It'
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  // Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  // Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[

            Image.file(_imageFile),

            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),

            Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  @override
  _Upload createState() => _Upload();


}

class _Upload extends State<Uploader>{
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  firebase_storage.Reference ref =
  firebase_storage.FirebaseStorage.instance.ref();

  UploadTask _uploadTask;

  //StorageReference _storage =  getReferenceFromUrl('gs://handle-comment.appspot.com');
  //StorageReference _storageReference = FirebaseStorage().ref();

/*  void _startUpload{
  String fileName = 'images/${DateTime.now()}.png';

  setState(() {
  _uploadTask = storage.ref().child(fileName).putFile(widget.file);

  });

  } */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text("Image Handler ",),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () async {

                  if(widget.file != null){
                    print('widget.file');
                    await firebase_storage.FirebaseStorage.instance
                        .ref()
                        .child('image/jpeg')
                        .putFile(widget.file);
                  }

                },
                child: Text('Upload'),
              ),
            ),

          ],),

      ),
    );
  }







}

