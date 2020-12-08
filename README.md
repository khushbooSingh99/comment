# comment

A Flutter Application made during a 2-Day Short-term Internship at Diverta.co. 
This app implements basic function of comment handling (Single Post Comment System) :
1. Add comments.
2. View added comments till date.
3. Upload Image file.
4. View Uploaded images.

The SEARCH COMMENTS option, in full-text mode can be implemented by "FireStore" and a third-party app like "Algolia/ElasticSearch", else we can also make "Trie" of comments and search using it.

The REPLY To COMMENT can be implemented as Map<String, List<String> >; making it a one-level reply back system.
  
FIREBASE has been used to store the comments and images uploaded by the user.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
