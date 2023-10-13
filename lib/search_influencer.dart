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
  bool isExpanded = false;

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
                  hintText: "Search for Influencers...",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(color: Colors.grey[600]),
              ),
              onChanged: (value) => _bloc.add(SearchQueryChanged(value)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                children: [
                  Icon(Icons.filter_list,),
                  SizedBox(width: 10),
                  Expanded(child: Text("Filter Influencer"))
                ],
              ),
            ),
          ),
          ClipRect(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: isExpanded ? MediaQuery.of(context).size.height - 150 : 0,  // Adjust the height as needed
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Funny"),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Creative"),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: Text("Travel"),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: Text("Gym"),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: Text("Food"),
                    ),
                  )

                ],
              ),
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
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                              ),
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  ClipRRect( // Clip the image with rounded corners
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        item.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            firstCharToUpper(item.title),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0, // Increase font size for title
                                            ),
                                          ),
                                          SizedBox(height: 5.0), // Add some spacing between title and description
                                          Text(
                                            item.description,
                                            style: TextStyle(
                                              color: Colors.grey[600], // Use a muted color for description
                                            ),
                                          ),
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