import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_care_app/services/auth_status.dart';
import 'package:health_care_app/services/fire_store_services.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;

  ///
  /// Helper Functions
  ///
  ///
   
  Future<AuthResultStatus> createAccount({email, pass}) async {
    try {
        UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: pass);
         _status = AuthResultStatus.successful;

         User? user = result.user;
       await DatabaseService(uid: user!.uid).updateUserData('new med', '100', '2 pm');
       await DatabaseService(uid: user!.uid).updateUserData2('whatever','whatever2','whatever3');
       //await DatabaseService(uid: user.uid).createUser(user);
     
    } on FirebaseAuthException catch(e) {
     if (e.code == "email-already-in-use"){
             _status=AuthResultStatus.emailAlreadyExists;
                 }
     else if (e.code == "too-many-requests"){
       _status=AuthResultStatus.tooManyRequests;
     }
     else if (e.code == "weak-password"){
       _status=AuthResultStatus.weakPassword;
     }
      
     else {
       _status=AuthResultStatus.undefined;
     }
    }
    return _status;
  }

  Future<AuthResultStatus> login({email, pass}) async {
    try {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
         _status = AuthResultStatus.successful;
     
    } on FirebaseAuthException catch(e) {
     if (e.code == "wrong-password"){
             _status=AuthResultStatus.wrongPassword;
                 }
     else if (e.code == "too-many-requests"){
       _status=AuthResultStatus.tooManyRequests;
     }
     
      else if (e.code == "user-not-found"){
       _status=AuthResultStatus.userNotFound;
     }
      else if (e.code == "user-disabled"){
       _status=AuthResultStatus.userDisabled;
     }
     else {
       _status=AuthResultStatus.undefined;
     }
    }
    return _status;
    
  }

  logout() {
    _auth.signOut();
  }
}

class AuthService { 
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;   
    User? get currentUser => _firebaseAuth.currentUser;  

    Future<User?> get0rCreateUser () async {  
      if(currentUser==null)
      { 
           await _firebaseAuth.signInAnonymously();
             }  
             return currentUser;
    }
    }