import 'package:bloc/bloc.dart';
import 'package:temu/firestore_repo.dart';
import 'package:temu/models/search/blocs/search_event.dart';
import 'package:temu/models/search/blocs/search_state.dart';
import 'package:temu/models/search/influencer.dart';

class InfluencerSearchBloc extends Bloc<SearchEvent, SearchState> {
  final FirestoreRepository _repository = FirestoreRepository();

  InfluencerSearchBloc() : super(SearchInitial()) {
    on<FetchInfluencers>((event, emit) async {
      List<Influencer> influencers = await _repository.fetchInfluencer();
      emit(InfluencersLoaded(influencers));
    });

    on<SearchQueryChanged>((event, emit) {
      List<Influencer> allInfluencers = (state as InfluencersLoaded).influencers;
      final filteredInfluencers = allInfluencers.where((inf) => inf.title.contains(event.query)).toList();
      emit(SearchResults(filteredInfluencers));
    });
  }
}
