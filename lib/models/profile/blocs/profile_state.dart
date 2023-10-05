part of 'profile_bloc.dart';

abstract class ProfileState {
  List<Profile> profiles;
  ProfileState({required this.profiles});
}

class ProfileInitial extends ProfileState {
  ProfileInitial({required List<Profile> profiles}) : super(profiles: profiles);
}

class ProfileUpdated extends ProfileState {
  ProfileUpdated({required List<Profile> profiles}) : super(profiles: profiles);
}
