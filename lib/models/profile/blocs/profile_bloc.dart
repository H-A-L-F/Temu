import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:temu/models/profile/profile.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial(profiles: [])) {
    on<AddProfile>(_addProfile);
    on<UpdateProfile>(_updateProfile);
    on<DeleteProfile>(_deleteProfile);
    on<GetProfile>(_getProfile);
    on<GetProfiles>(_getProfiles);
  }

  void _addProfile(AddProfile event, Emitter<ProfileState> emit) {
    state.profiles.add(event.profile);
    emit(ProfileUpdated(profiles: state.profiles));
  }

  void _updateProfile(UpdateProfile event, Emitter<ProfileState> emit) {}

  void _deleteProfile(DeleteProfile event, Emitter<ProfileState> emit) {}

  void _getProfile(GetProfile event, Emitter<ProfileState> emit) {}

  void _getProfiles(GetProfiles event, Emitter<ProfileState> emit) {}
}
