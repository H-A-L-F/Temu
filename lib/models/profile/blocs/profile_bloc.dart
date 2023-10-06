import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    // add profile
    emit(ProfileUpdated(profiles: state.profiles));
  }

  void _updateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    // update profile
    emit(ProfileUpdated(profiles: state.profiles));
  }

  void _deleteProfile(DeleteProfile event, Emitter<ProfileState> emit) {
    // delete profile
    emit(ProfileUpdated(profiles: state.profiles));
  }

  void _getProfile(GetProfile event, Emitter<ProfileState> emit) {
    // get a profile
    emit(ProfileUpdated(profiles: state.profiles));
  }

  void _getProfiles(GetProfiles event, Emitter<ProfileState> emit) {
    // get all profile
    emit(ProfileUpdated(profiles: state.profiles));
  }
}
