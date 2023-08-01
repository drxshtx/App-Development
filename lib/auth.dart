import 'package:budget_app/structure/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on firebase obj
  Users? _userFromFirebase(User? user){
    return user!=null? Users(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges()
    //.map((User? user)=> _userFromFirebase(user));
    .map(_userFromFirebase);
  }
  //sign in anonymous
 Future signInAnan () async{
   try{
     UserCredential result = await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebase(user);
   }catch(e){
     // ignore: avoid_print
     print(e.toString());
     return null;
   }
 }
  //sign in with email and password
  //register with email
  //sign out
}