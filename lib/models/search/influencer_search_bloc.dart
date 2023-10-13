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
      influencers = influencers.map((inf) =>
          Influencer(
            tags: inf.tags,
            firstName: inf.firstName.toLowerCase(),
            profileImage: inf.profileImage,
            description: inf.description,
            lastName: inf.lastName,
          )
      ).toList();
      emit(InfluencersLoaded(influencers));
    });

    on<SearchQueryChanged>((event, emit) async {
      if (event.query == "") {
        List<Influencer> influencers = await _repository.fetchInfluencer();
        influencers = influencers.map((inf) =>
            Influencer(
              tags: inf.tags,
              firstName: inf.firstName.toLowerCase(),
              profileImage: inf.profileImage,
              description: inf.description,
              lastName: inf.lastName
            )
        ).toList();
        emit(InfluencersLoaded(influencers));
        return;
      }
      List<Influencer> allInfluencers = (state is InfluencersLoaded) ?
        (state as InfluencersLoaded).influencers :
        (state as SearchResults).filteredInfluencer;
      final filteredInfluencers = allInfluencers.where((inf) => inf.firstName.contains(event.query.toLowerCase())).toList();
      emit(SearchResults(filteredInfluencers));
    });
  }
}
