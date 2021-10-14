import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  SearchRepository( this._sharedPrefsHelper);
  void setRecentSearch(search) async {
    if (search != null) {
      await _sharedPrefsHelper.setRecentSearch(search);
    }
  }

  Future<String> getRecentSearch() async {
    return _sharedPrefsHelper.getRecentSearch??  _sharedPrefsHelper.getRecentSearch!;
  }
}
