import 'package:cloud_firestore/cloud_firestore.dart';

class LastOnline{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to get the is_online status based on user_id
  Future<bool> getUserIsOnline(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(userId).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;
        return data?['is_online'] ?? false;
      } else {
        print("User not found");
        return false;
      }
    } catch (e) {
      print("Error fetching is_online status: $e");
      return false;
    }
  }

  // Function to get the last_active time based on user_id
  Future<String> getUserLastActive(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(userId).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;
        return data?['last_active'] ?? 'Unknown';
      } else {
        print("User not found");
        return 'Unknown';
      }
    } catch (e) {
      print("Error fetching last_active time: $e");
      return 'Unknown';
    }
  }
}
  

