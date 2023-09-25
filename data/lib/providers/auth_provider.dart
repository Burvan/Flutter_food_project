import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';


class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection(AppString.userCollection);

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  Future<UserEntity> fetchUser({
    required String id,
  }) async {
    final DocumentSnapshot documentSnapshot = await _collection.doc(id).get();
    final Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    if (data != null && data.containsKey('users')) {
      final UserEntity userEntity = UserEntity.fromJson(data);
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
    final DocumentSnapshot documentSnapshot = await _collection.doc(id).get();

    final Map<String, String> userData = {
      'id': id,
      'email': email,
      'name': name,
    };

    if (!documentSnapshot.exists) {
      _collection.doc(id).set(userData);
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

    final UserEntity userEntity = await fetchUser(
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
    final UserEntity userEntity = await fetchUser(
      id: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  Future<UserEntity> googleSignIn() async {
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
        await fetchUser(id: userCredential.user?.uid ?? '');

    return userEntity;
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}
