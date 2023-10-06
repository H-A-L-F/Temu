class SocialMedia {
  final String name;
  final String account;

  SocialMedia({
    required this.name,
    required this.account,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      name: json['name'],
      account: json['account'],
    );
  }
}

class Profile {
  final String authID;
  final String firstName;
  final String? lastName;
  final String? profileImage;
  final String gender;
  final DateTime dob;
  final String location;
  final String? introduction;
  final List<String>? tag;
  final List<SocialMedia>? socialMedia;

  Profile({
    required this.authID,
    required this.firstName,
    this.lastName,
    this.profileImage,
    required this.gender,
    required this.dob,
    required this.location,
    this.introduction,
    this.tag,
    this.socialMedia,
  });

  // factory Profile.fromJson(Map<String, dynamic> json) {
  //   return Profile(
  //     authID: json['authID'],
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     profileImage: json['profileImage'],
  //     gender: json['gender'],
  //     dob: DateTime.parse(json['dob']),
  //     location: json['location'],
  //     introduction: json['introduction'],
  //     tag: List<String>.from(json['tag']),
  //     socialMedia: (json['socialMedia'] as List<dynamic>)
  //         .map((media) => SocialMedia.fromJson(media))
  //         .toList(),
  //   );
  // }
}
