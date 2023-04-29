class ProfileModel {
  final String name;
  final String location;
  final String about;
  final String profile_pic;
  final int min_clients;
  final int min_handled_projects;
  final int min_years_experience;
  final List<String> dummy_portfolio_pics;
  final List<String> social_icons;

  const ProfileModel({
    required this.name,
    required this.location,
    required this.about,
    required this.profile_pic,
    required this.min_clients,
    required this.min_handled_projects,
    required this.min_years_experience,
    required this.dummy_portfolio_pics,
    required this.social_icons,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        location = json['location'],
        about = json['about'],
        profile_pic = json['profile_pic'],
        min_clients = json['min_clients'],
        min_handled_projects = json['min_handled_projects'],
        min_years_experience = json['min_years_experience'],
        dummy_portfolio_pics = List<String>.from(json['dummy_portfolio_pics']),
        social_icons = List<String>.from(json['social_icons']);

  @override
  String toString() {
    return 'name: $name, '
        'location: $location, '
        'about: $about, '
        'profile_pic: $profile_pic, '
        'min_clients: $min_clients, '
        'min_handled_projects: $min_handled_projects, '
        'min_years_experience: $min_years_experience, '
        'dummy_portfolio_pics: $dummy_portfolio_pics, '
        'social_icons: $social_icons';
  }
}
