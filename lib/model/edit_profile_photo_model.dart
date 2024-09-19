import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:devotee/utils/constants.dart';

class EditProfilePhotoModel {
  EditProfilePhotoModel();

  Map<String, dynamic> toJson() {
    return {
      "step_12": "1",
    };
  }

  static Future<Map<String, dynamic>> editProfile(
      EditProfilePhotoModel profileModel, File imageFile,String value) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['step_11'] = '1';

    // Attach the image to the 'Photo1' field
    request.files.add(await http.MultipartFile.fromPath(value, imageFile.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
