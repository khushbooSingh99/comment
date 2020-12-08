import 'package:flutter/material.dart';
import 'package:comment/submit_field.dart';

class SubmitContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add comments here"),
      ),
      body: EnterField(),
    );
  }
}