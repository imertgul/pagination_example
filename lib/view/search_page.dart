import 'package:dh_case/repository/movie_repository.dart';
import 'package:dh_case/util/showDialog.dart';
import 'package:flutter/material.dart';

import '../model/search_response.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final repo = MovieRepository();
  final _queryInput = TextField(
    controller: TextEditingController(),
  );
  SearchResponse? searchResult;

  getSearchResults() async {
    try {
      final resp = await repo.searchMovie(_queryInput.controller!.text);
      if (mounted) {
        setState(() {
          searchResult = resp;
        });
      }
    } on Exception catch (e) {
      showAlertDialog(context, e.toString(), 'Err');
    }
  }

  @override
  void initState() {
    super.initState();
    // _queryInput.controller!.addListener(() {
    //   if (_queryInput.controller!.text.length > 2) {
    //     getSearchResults();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(child: _queryInput),
                IconButton(
                    onPressed: () {
                      getSearchResults();
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
          searchResult == null
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView(
                    children: [
                      ...searchResult!.results.map((e) => Text(e.toString()))
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
