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

  @override
  void initState() {
    super.initState();
    _bloc = InfluencerSearchBloc();
    _bloc.add(FetchInfluencers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)
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
                          return Card(
                            child: ListTile(
                              leading: Image.network(item.imageUrl),
                              title: Text(item.title),
                              subtitle: Text(item.description),
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