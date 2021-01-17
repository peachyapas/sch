// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; //for randomization

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Welcome to Flutter',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     child: Text('Hello World'),
      //     // child: Text('wordPair.asPascalCase'), //Pascal case” (also known as “upper camel case”), means that each word in the string, including the first one, begins with an uppercase letter. So, “uppercamelcase” becomes “UpperCamelCase”.
      //     child: RandomWords(), //now calls the RandomWords class
      //   ),
      // ),
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <
      WordPair>[]; //_suggestions list to the _RandomWordsState class for saving suggested word pairings
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  // _buildSuggestions() function to the _RandomWordsState class.
  // This method builds the ListView that displays the suggested word pairing.
  // ListView class provides a builder property, itemBuilder, that’s a factory builder and
  // callback function specified as an anonymous function.
  // Two parameters are passed to the function—the (1) BuildContext, and the (2) row iterator, i.
  // The iterator begins at 0 and increments each time the function is called.
  // It increments twice for every suggested word pairing: once for the ListTile,
  // and once for the Divider. This model allows the suggested list to continue growing as
  // the user scrolls.

  // Widget buildSuggestions() {
  //   return ListView.builder(
  //       padding: EdgeInsets.all(16.0),
  //       itemBuilder: /*1*/ (context, i) {
  //         if (i.isOdd) return Divider(); /*2*/

  //         final index = i ~/ 2; /*3 */
  //         if (index >= _suggestions.length) {
  //           _suggestions.addAll(generateWordPairs().take(10));
  //         }
  //         return _buildRow(_suggestions[index]);
  //       });
  // }

}
