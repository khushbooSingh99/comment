import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:comment/submit_field.dart';


//displaying the added comments till-date

//the comments are sorted by USER NAMES
class DisplayCommentsAdded extends StatefulWidget{

  @override
  _DisplayCommentState createState() => _DisplayCommentState();

}

class _DisplayCommentState extends State<DisplayCommentsAdded> {

  //for taking reply for comment
  final _myControlUser = TextEditingController();

  Query _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
        .child('Comments').orderByChild('user');
    //reference to the data in RTDB
  }



  //this returns us a listitem to be added as a view in the listItem screen for comments

  Widget _buildListItem( {Map comment}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(children: [
            Icon(Icons.person,
              color:Theme.of(context).primaryColor,
              size: 10,),
            SizedBox(width: 10,),
            Text(comment['user'],
              style: TextStyle(fontSize: 20,
                  color: Theme.of(context).primaryColor,),
            ),
          ],
          ),
          SizedBox(height: 10,),
          Row(children: [
            Flexible(
              child: new Container(
                padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  comment['comment'],
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
          ),
          SizedBox(height: 10,),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  //add this to the existing comment as a chain
                  // add_replies feauture
                  //  addReply();

                },
                child: Text('Reply to this comment'),

              ),
            ),
          ],
          ),

        ]
      )
    );
  }

 // void addReply(){
  //  String commented = _myControlUser.text;

  //};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        height: double.infinity, //takes up all of the screen
        child: FirebaseAnimatedList(query: _ref , itemBuilder: (BuildContext context,
        DataSnapshot snapshot, Animation<double> animation, int index){

          //this contains all the value of one field of our database
          Map eachComment = snapshot.value;

          return _buildListItem(comment: eachComment);
        },),

      ),
    );
  }
}