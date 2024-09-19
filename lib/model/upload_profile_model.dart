import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:devotee/utils/constants.dart';

class UploadProfileModel {
  UploadProfileModel();

  Map<String, dynamic> toJson() {
    return {
      "step_11": "1",
    };
  }

  static Future<Map<String, dynamic>> profileComplete(
      UploadProfileModel profileAModel, List<File> imageFiles) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['step_11'] = '1';

    // Map the files to specific fields in the request
    List<String> imageFields = ['Photo1', 'Photo2', 'Photo3', 'Photo4', 'Photo5'];
    
    for (int i = 0; i < imageFiles.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(imageFields[i], imageFiles[i].path));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      throw Exception('Failed to update profile');
    }
  }
}