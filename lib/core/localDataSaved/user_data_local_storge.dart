import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataCache {
  static const _cacheKey = 'user_data';

  /// 🔁 Starts listening to Firestore changes and caches the data automatically
  void startUserStream() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((snapshot) async { 
      final data = snapshot.data();
      if (data != null) {
        final prefs = await SharedPreferences.getInstance();
        final jsonString = json.encode(data);
        await prefs.setString(_cacheKey, jsonString);
      }
    });
  }

  /// 🧠 Returns cached data as Map<String, dynamic>
  Future<Map<String, dynamic>?> getCachedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cacheKey);
    if (jsonString == null) return null;
    return json.decode(jsonString);
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cacheKey);
  }
}
