/*Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: TextField(
                  onChanged: (val) {
                    initiateSearch(val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back),
                      iconSize: 20.0,
                      onPressed: () {
                        //go to new page_updation

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder : (context) => DisplayCommentsAdded() ),
                        );

                      },
                    ),
                    contentPadding: EdgeInsets.only(left: 25.0),
                    hintText: 'Search comments',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0)

                    ),
                  )

              ),
            )
 */

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';



//was not able to implement it
//but will make a new branch if I do get a code
class SearchQuery extends StatefulWidget{

  @override
  _SearchQueryState createState() =>  _SearchQueryState() ;
}

class  _SearchQueryState extends State <SearchQuery>{

  //TextEditingController editingController = TextEditingController();
//  bool _anchorToBottom = false;
//  FirebaseDatabaseUtil databaseUtil;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
    );
  }
}

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          child: Center(
              child: Text(data['businessName'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              )
          )
      )
  );
 }
