class UserProfile {
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? locationName;
  String? profileImage;

  UserProfile({
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.locationName,
    this.profileImage,
  });

  // Method to convert JSON map into UserProfile object
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      locationName: json['location_name'] as String?,
      profileImage: json['profile_image'] as String?,
    );
  }

  // Method to convert UserProfile object into JSON map
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'mobile_number': mobileNumber,
      'location_name': locationName,
      'profile_image': profileImage,
    };
  }
}