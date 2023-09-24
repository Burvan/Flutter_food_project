import 'package:core/core.dart';
import 'package:data/entities/user/user_entity.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  Future<UserEntity> getUser({
    required String id,
  }) async {
    final DocumentSnapshot documentSnapshot = await collection.doc(id).get();
    final Object? data = documentSnapshot.data();
    if (data != null && data is Map<String, dynamic>) {
      final UserEntity userEntity = UserEntity(
        id: id,
        name: data['name'],
        email: data['email'],
      );
      return userEntity;
    } else {
      final UserEntity userEntity = UserEntity(
        id: id,
        name: '',
        email: '',
      );
      return userEntity;
    }
  }

  Future<void> saveUser({
    required String id,
    required String email,
    required String name,
  }) async {
    final DocumentSnapshot documentSnapshot = await collection.doc(id).get();

    final Map<String, String> userData = {
      'id': id,
      'email': email,
      'name': name,
    };

    if (!documentSnapshot.exists) {
      collection.doc(id).set(userData);
    }
  }

  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await saveUser(
      id: credential.user?.uid ?? '',
      email: credential.user?.email ?? '',
      name: name,
    );

    final UserEntity userEntity = await getUser(
      id: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserEntity userEntity = await getUser(
      id: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  Future<UserEntity> signInUsingGoogleAcc() async {
    final GoogleSignInAccount? googleAcc = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuth =
        await googleAcc?.authentication;
    final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuth?.accessToken,
      idToken: googleSignInAuth?.idToken,
    );
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(oAuthCredential);

    await saveUser(
      id: userCredential.user?.uid ?? '',
      email: userCredential.user?.email ?? '',
      name: userCredential.user?.displayName ?? '',
    );

    final UserEntity userEntity =
        await getUser(id: userCredential.user?.uid ?? '');

    return userEntity;
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}
