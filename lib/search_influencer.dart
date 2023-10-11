import 'package:flutter/material.dart';
import 'package:temu/models/search/blocs/search_event.dart';
import 'package:temu/models/search/influencer.dart';
import 'package:temu/models/search/influencer_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/search/blocs/search_state.dart';


class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late InfluencerSearchBloc _bloc;
  final double cardHeight = 100.0;

  @override
  void initState() {
    super.initState();
    _bloc = InfluencerSearchBloc();
    _bloc.add(FetchInfluencers());
  }

  String firstCharToUpper(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0, bottom: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(Icons.search)
              ),
              onChanged: (value) => _bloc.add(SearchQueryChanged(value)),
            ),
          ),
          Expanded(
              child: BlocBuilder<InfluencerSearchBloc, SearchState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Center(child: Text("Fetching influencers"));
                  }
                  if (state is InfluencersLoaded || state is SearchResults) {
                    List<Influencer> influencers = (state is InfluencersLoaded)
                        ? state.influencers
                        : (state as SearchResults).filteredInfluencer;
                    if (influencers.isEmpty) {
                      return const Center(child: Text("No results found"));
                    }

                    return ListView.builder(
                        itemCount: influencers.length,
                        itemBuilder: (context, index) {
                          final item = influencers[index];
                          return Container(
                            height: cardHeight,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                                  side: BorderSide.none
                              ),
                              color: Colors.white,
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      item.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(firstCharToUpper(item.title)),
                                          Text(item.description),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }
                  return const Center(child: Text("Unknown state"));
                }
              )
          )
        ],
      ),
    );
  }
}