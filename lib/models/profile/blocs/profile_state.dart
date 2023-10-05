part of 'profile_bloc.dart';

abstract class ProfileState {
  List<Map<String, dynamic>> profiles;
  ProfileState({required this.profiles});
}

class ProfileInitial extends ProfileState {
  ProfileInitial({required List<Map<String, dynamic>> profiles})
      : super(profiles: profiles);
}

class ProfileUpdated extends ProfileState {
  ProfileUpdated({required List<Map<String, dynamic>> profiles})
      : super(profiles: profiles);
}
