import '../influencer.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class InfluencersLoaded extends SearchState {
  final List<Influencer> influencers;
  InfluencersLoaded(this.influencers);
}

class SearchResults extends SearchState {
  final List<Influencer> filteredInfluencer;
  SearchResults(this.filteredInfluencer);
}