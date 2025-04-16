import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSeyOwG9-8yDbcmgk6BTpopDTJiCswujM",
            authDomain: "agendamentos-bac97.firebaseapp.com",
            projectId: "agendamentos-bac97",
            storageBucket: "agendamentos-bac97.appspot.com",
            messagingSenderId: "638582227346",
            appId: "1:638582227346:web:475c0cc8675f71973c414b"));
  } else {
    await Firebase.initializeApp();
  }
}
