// Import Installed Packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Pages
import 'package:shopify/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;

  bool isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      isLoading = true;
    });

    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      // User does not have ability to go back to the login page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      isLoading = false;
    });
  }

  Future handleSignIn() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true;
    });

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(authCredential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
        .collection("users")
        .where("id", isEqualTo: firebaseUser.uid)
        .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;
      
      //Sign up the user if they do not exist in Firebase
      if(documents.length == 0){
        Firestore.instance.collection("user").document(firebaseUser.uid).setData(
          {
            "id" : firebaseUser.uid,
            "username" : firebaseUser.displayName,
            "profile_picture" : firebaseUser.photoUrl,
          }
        );

        await sharedPreferences.setString("id", firebaseUser.uid);
        await sharedPreferences.setString("username", firebaseUser.displayName);
        await sharedPreferences.setString("profile_picture", firebaseUser.photoUrl);
      }
      else{
        await sharedPreferences.setString("id", documents[0]["id"]);
        await sharedPreferences.setString("username", documents[0]["username"]);
        await sharedPreferences.setString("profile_picture", documents[0]["profile_picture"]);
      }
      Fluttertoast.showToast(msg: "Successfully Logged In");
      setState(() {
        isLoading = false;
      });
      
		} else {
      
    }
  }

  @override
  Widget build(BuildContext context) {
	return Container();
  }
}
