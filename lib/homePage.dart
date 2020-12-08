import 'package:flutter/material.dart';
import 'package:comment/submission.dart';
import 'package:comment/displayComments.dart';
import 'package:comment/search_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:comment/view_image.dart';
import 'package:comment/add_image.dart';
import 'package:comment/adding_image.dart';
import 'package:comment/viewing_image.dart';


class Display extends StatefulWidget{
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display>{


  String user;
  String date;
  String content;
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text("Comment Handler ",),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => DisplayCommentsAdded() ),
                  );

              },
                child: Text('View Comments'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => SearchQuery() ),
                  );

                },
                child: Text('Go to searching comment'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => ViewMe() ),
                  );

                },
                child: Text('View uploaded images'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => ProfilePage() ),
                  );

                },
                child: Text('upload images'),
              ),
            ),
          ],),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder : (context) => SubmitContent() ),
          );
        },
      ),
    );
  }
}

