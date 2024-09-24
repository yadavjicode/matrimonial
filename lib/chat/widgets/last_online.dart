import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devotee/chat/helper/my_date_util.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';

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
  
class UserStatusWidget extends StatelessWidget {
  final String userId;
  final int onlineStatus;
  final int lastSeenStatus;
  final LastOnline lastOnlineService = LastOnline();
  UserStatusWidget({required this.userId,required this.onlineStatus,required this.lastSeenStatus});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: lastOnlineService.getUserIsOnline(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is being resolved
          return Text(
            'Loading...',
            style: FontConstant.styleMedium(
            fontSize: 13, color: AppColors.darkgrey),
          );
        } else if (snapshot.hasError) {
          // If an error occurred
          return Text(
            'Error: ${snapshot.error}',
            style: FontConstant.styleMedium(
            fontSize: 13, color: AppColors.darkgrey),
          );
        } else if (snapshot.hasData) {
          // If the future returned a value
          bool isOnline = snapshot.data ?? false;

          if (isOnline&& onlineStatus==0) {
            return Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: AppColors.green, shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Online',
                  style: FontConstant.styleMedium(
                  fontSize: 13, color: AppColors.green),
                ),
              ],
            );
          } else if(lastSeenStatus==0) {
            // If the user is not online, show the last active time
            return FutureBuilder<String>(
              future: lastOnlineService.getUserLastActive(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    'Loading...',
                    style: FontConstant.styleMedium(
                        fontSize: 13, color: AppColors.darkgrey),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: FontConstant.styleMedium(
                        fontSize: 13, color: AppColors.darkgrey),
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: AppColors.grey, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Text(
                          '${MyDateUtil.getLastActiveTime(context: context, lastActive: "${snapshot.data}")}',
                          style: FontConstant.styleMedium(
                              fontSize: 13, color: AppColors.darkgrey),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }else{
            return Text("");
          }
        } else {
          return Text('Unknown status');
        }
      },
    );
  }
}

