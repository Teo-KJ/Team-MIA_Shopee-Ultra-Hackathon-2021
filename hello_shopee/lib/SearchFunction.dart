import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() => runApp(SearchFunction());

class SearchFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class Post {
  final String differentLanguage;
  final String defaultLanguage;

  Post(this.differentLanguage, this.defaultLanguage);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String translatedPhrase = '';
  GoogleTranslator translator = GoogleTranslator();
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      translator.translate(search, from: 'en', to: 'ms').then((t) {
        //setState(() {
        translatedPhrase = t.text;
        //});
      });
      return Post(
        "$translatedPhrase",
        "$search",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.differentLanguage),
                subtitle: Text(post.defaultLanguage),
              );
            },
            searchBarStyle: SearchBarStyle(
              backgroundColor: Colors.lightBlue[100],
              padding: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(10),
            ),
            loader: Text("Loading..."),
          ),
        ),
      ),
    );
  }
}
