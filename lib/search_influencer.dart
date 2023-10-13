import 'package:flutter/material.dart';
import 'package:temu/invite_influencer.dart';
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

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin {
  late InfluencerSearchBloc _bloc;
  final double cardHeight = 100.0;
  bool isExpanded = false;
  List<String> tagHave = [];
  Map<String, AnimationController> tagControllers = {};

  @override
  void initState() {
    super.initState();
    _bloc = InfluencerSearchBloc();
    _bloc.add(FetchInfluencers());
  }

  @override
  void dispose() {
    tagControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
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
                    borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
              duration: const Duration(milliseconds: 200),
              height: tagHave.isNotEmpty ? 40 : 0,
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: tagHave.map((tag) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        AnimationController? controller = tagControllers[tag];
                        if (controller != null) {
                          controller.reverse().then((_) {
                            tagHave.remove(tag);
                            controller.dispose();
                            tagControllers.remove(tag);
                          });
                        } else {
                          // If for some reason the controller is null, just remove the tag without animation
                          tagHave.remove(tag);
                        }
                      });
                    },
                    child: ScaleTransition(
                      scale: tagControllers[tag]?.drive(Tween(begin: 0.0, end: 1.0)) ?? AlwaysStoppedAnimation(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xDFDFDFDFDF),
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                        margin: const EdgeInsets.only(top: 10.0, left: 16.0, right: 8.0, bottom: 1.0),
                        child: Text(tag),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          ClipRect(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: isExpanded ? MediaQuery.of(context).size.height - 150 : 0,  // Adjust the height as needed
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!tagControllers.containsKey("Funny")) {
                          tagControllers["Funny"] = AnimationController(
                            duration: const Duration(milliseconds: 300),
                            vsync: this,
                          )..forward();
                        }
                        tagHave.add("Funny");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Funny"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!tagControllers.containsKey("Creative")) {
                          tagControllers["Creative"] = AnimationController(
                            duration: const Duration(milliseconds: 300),
                            vsync: this,
                          )..forward();
                        }
                        tagHave.add("Creative");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Creative"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!tagControllers.containsKey("Travel")) {
                          tagControllers["Travel"] = AnimationController(
                            duration: const Duration(milliseconds: 300),
                            vsync: this,
                          )..forward();
                        }
                        tagHave.add("Travel");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Travel"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!tagControllers.containsKey("Gym")) {
                          tagControllers["Gym"] = AnimationController(
                            duration: const Duration(milliseconds: 300),
                            vsync: this,
                          )..forward();
                        }
                        tagHave.add("Gym");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Gym"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!tagControllers.containsKey("Food")) {
                          tagControllers["Food"] = AnimationController(
                            duration: const Duration(milliseconds: 300),
                            vsync: this,
                          )..forward();
                        }
                        tagHave.add("Food");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xDFDFDFDFDF),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      margin: const EdgeInsets.only(top: 40.0, left: 16.0, right: 8.0, bottom: 8.0),
                      child: const Text("Food"),
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
                    List<Influencer> filteredInfluencers = influencers;
                    if (tagHave.isNotEmpty) {
                      filteredInfluencers = influencers.where((inf) {
                        return inf.tags.any((tag) => tagHave.contains(tag));
                      }).toList();
                    }
                    if (filteredInfluencers.isEmpty) {
                      return const Center(child: Text("No results found"));
                    }

                    return ListView.builder(
                        itemCount: filteredInfluencers.length,
                        itemBuilder: (context, index) {
                          final item = filteredInfluencers[index];
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  InviteInfluencer(influencer: item)
                                  ))
                            },
                            child: Container(
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
                                          item.profileImage,
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
                                              firstCharToUpper(item.firstName),
                                              style: const TextStyle(
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