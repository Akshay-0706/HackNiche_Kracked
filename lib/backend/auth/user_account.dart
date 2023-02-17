import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'account.dart';

class UserAccount {
  static Future<Account?> googleLogin() async {
    final googleSignIn = GoogleSignIn();

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    String name = userCredentials.user!.displayName!;
    String email = userCredentials.user!.email!;
    String photo = userCredentials.user!.photoURL!;
    String id = userCredentials.user!.uid;

    return Account(name, email, photo, id, googleAuth.accessToken!);
  }

  static Future<void> googleLogout() async {
    GetStorage().write('signedIn', false);
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
