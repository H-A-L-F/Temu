part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class AddProfile extends ProfileEvent {
  final Map<String, dynamic> profile;

  AddProfile({required this.profile});
}

class UpdateProfile extends ProfileEvent {
  final String profileID;
  final Map<String, dynamic> profile;

  UpdateProfile({required this.profileID, required this.profile});
}

class DeleteProfile extends ProfileEvent {
  final String profileID;

  DeleteProfile({required this.profileID});
}

class GetProfile extends ProfileEvent {
  final String profileID;

  GetProfile({required this.profileID});
}

class GetProfiles extends ProfileEvent {}
