import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Facebook Sign In',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SignInScreen(),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class SignInScreen extends StatelessWidget {
  Future<UserCredential?> signInWithFacebook(BuildContext context) async {
    try {
      // Log in with Facebook
      final LoginResult result = await FacebookAuth.instance.login();
      print("hgjgfjhjgk");
      // Check if login is successful
      if (result.status == LoginStatus.success) {
        // Get access token
        final AccessToken accessToken = result.accessToken!;

        // Create Firebase credential using Facebook access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        // Sign in to Firebase with Facebook credential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        // Handle failed login
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to sign in with Facebook'),
        ));
        return null;
      }
    } catch (e) {
      print('Error signing in with Facebook: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to sign in with Facebook'),
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
            UserCredential? userCredential = await signInWithFacebook(context);
            if (userCredential != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(userCredential.user!),
                ),
              );
            }
          },
          child: Text('Sign in with Facebook'),
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
