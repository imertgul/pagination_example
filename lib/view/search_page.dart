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
  List<MovieResult>? results;

  getSearchResults() async {
    try {
      final resp = await repo.searchMovie(_queryInput.controller!.text);
      if (mounted) {
        setState(() {
          searchResult = resp;
          results = List.from(searchResult!.results);
        });
        print('helllo new datas');
      }
    } on Exception catch (e) {
      showAlertDialog(context, e.toString(), 'Err');
    }
  }

  getMoreSearchResults() async {
    try {
      if (searchResult == null) throw Exception('page is empty');
      final resp = await repo.searchMovie(_queryInput.controller!.text,
          page: searchResult!.page + 1);
      if (mounted) {
        setState(() {
          searchResult = resp;
          results!.addAll(searchResult!.results);
        });
        _queryInput.scrollController!.animateTo(0,
            duration: const Duration(milliseconds: 50), curve: Curves.linear);
      }
    } on Exception catch (e) {
      showAlertDialog(context, e.toString(), 'Error');
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
              results == null
                  ? _buildLabel('Type something to search')
                  : Expanded(
                      child: searchResult!.totalPages == 0
                          ? _buildLabel('No result')
                          : GridView.builder(
                              itemCount: results!.length + 1,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      childAspectRatio: 0.8),
                              itemBuilder: (BuildContext context, int index) {
                                if (index == results!.length) {
                                  if (searchResult!.totalPages ==
                                      searchResult!.page) {
                                    return _buildLabel('End of Page');
                                  } else {
                                    getMoreSearchResults();
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                } else {
                                  return MovieResultWidget(
                                      key: Key('Movie$index'),
                                      movie: results![index]);
                                }
                              },
                            ),
                    ),
              if (searchResult != null)
                _buildLabel(
                    'Page: ${searchResult!.page}, Total page: ${searchResult!.totalPages}, ${results!.length} loaded')
            ],
          ),
        ),
      ),
    );
  }

  Center _buildLabel(String label) => Center(child: Text(label));
}
