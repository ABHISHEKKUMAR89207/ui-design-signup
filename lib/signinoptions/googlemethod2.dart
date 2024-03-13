import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a Future to initialize Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase Future
      future: _initialization,
      builder: (context, snapshot) {
        // Check if Firebase initialization is complete
        if (snapshot.connectionState == ConnectionState.done) {
          // If initialization is complete, build your app
          return MaterialApp(
            title: 'Flutter Google Sign In',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SignInScreen(),
          );
        } else {
          // Show a loading indicator while waiting for Firebase initialization to complete
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class SignInScreen extends StatelessWidget {
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      try {
        await _googleSignIn.signOut();
        print("User signed out");
      } catch (error) {
        print("Error signing out: $error");
      }
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign-in canceled by user'),
        ));
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(
          'Google ID: ${googleUser.id}  hhhhhhhh $googleAuth   iddddddd ${credential}');
      print(
          'Eddgdfgdfgdfgfd e ${googleAuth.idToken}   ${googleAuth.accessToken}  ');
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error signing in with Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to sign in with Google'),
      ));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            UserCredential? userCredential = await signInWithGoogle(context);
            if (userCredential != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(userCredential.user!)),
              );
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, ${user.displayName}!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
