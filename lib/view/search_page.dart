import 'package:dh_case/repository/movie_repository.dart';
import 'package:dh_case/util/show_alert_dialog.dart';
import 'package:dh_case/view/widgets/movie_result_widget.dart';
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
    _queryInput.controller!.addListener(() {
      if (_queryInput.controller!.text.length > 2) {
        getSearchResults();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 75,
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
                  ? const Center(child: Text('Type something to search'))
                  : Expanded(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300, childAspectRatio: 0.8),
                        children: [
                          ...searchResult!.results
                              .map((e) => MovieResultWidget(movie: e))
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
