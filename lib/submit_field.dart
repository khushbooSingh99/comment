import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:comment/add_image.dart';


//takes in user input for comment addition

class EnterField extends StatefulWidget{

  @override
  _EnterFieldState createState(){
    return _EnterFieldState();
  }
}

class _EnterFieldState extends State<EnterField>{

    //TextEditingController for proceesing what the user wrote
  final _myControlUser = TextEditingController();
  final _myControlComment= TextEditingController();
  DatabaseReference _ref;


  //creates unique key in database for storage
  final _formKey= GlobalKey<FormState>();

  @override
  void initState(){
    _ref = FirebaseDatabase.instance.reference().child('Comments');

  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myControlUser.dispose();
    _myControlComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _myControlUser,
            decoration: const InputDecoration(
              hintText: 'Enter your user name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            controller: _myControlComment,
            decoration: const InputDecoration(
              hintText: 'Enter your comment. . .',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data if valid form.
                  addComment();
                }
              },
              child: Text('Submit'),

            ),
          ),
        ]
      )
    );
  }


  //function to add the input data to RTDB
  void addComment(){
    String userName = _myControlUser.text;
    String commented = _myControlComment.text;

    Map<String, String > commentList ={
      'user': userName,
      'comment': commented,
      'replies': commented,
    };
    //was trying to create List<string> but was not succesful

    _ref.push().set(commentList).then((value) {
      Navigator.pop(context);
    });

  }
}

