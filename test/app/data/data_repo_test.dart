import 'package:assessment/app/data/data_repo.dart';
import 'package:assessment/app/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Data Repo Texts: ', () {
    late ProfileModel profile;

    test('Data successfully loaded from Json', () async {
      profile = ProfileModel.fromJson(await DataRepo.loadData());

      // Just testing with some of the hardcoded values
      expect(profile.name, 'Bima Sakti');
      expect(profile.location, 'Tanjung Pinang');
      expect(profile.min_clients, 40);
      expect(profile.min_handled_projects, 54);
      expect(profile.min_years_experience, 2);
    });
  });
}
