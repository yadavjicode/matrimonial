import 'package:shared_preferences/shared_preferences.dart';

class getData {
  static final getData _instance = getData._internal();

  factory getData() {
    return _instance;
  }

  getData._internal();

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Method to get a value from SharedPreferences
  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Method to set a value in SharedPreferences
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Method to clear a value from SharedPreferences
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  // Method to clear all data from SharedPreferences
  Future<void> clear() async {
    await _prefs.clear();
  }
}
