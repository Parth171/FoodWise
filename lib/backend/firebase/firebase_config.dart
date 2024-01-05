import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBhtyFbZRvblLQdWq7-wq9Fz37T0R8UVa4",
            authDomain: "grocerylistapp-e2848.firebaseapp.com",
            projectId: "grocerylistapp-e2848",
            storageBucket: "grocerylistapp-e2848.appspot.com",
            messagingSenderId: "283183454644",
            appId: "1:283183454644:web:069ed07a296e4b3aebfae1"));
  } else {
    await Firebase.initializeApp();
  }
}
