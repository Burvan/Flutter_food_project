import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppRouter _appRouter;
  final SignInUseCase _signInUseCase;
  final GoogleSignInUseCase _signInUsingGoogleAccUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetStoredUserUseCase _getStoredUserUseCase;

  AuthBloc({
    required AppRouter appRouter,
    required SignInUseCase signInUseCase,
    required GoogleSignInUseCase signInUsingGoogleAccUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required GetStoredUserUseCase getStoredUserUseCase,
  })  : _appRouter = appRouter,
        _signInUseCase = signInUseCase,
        _signInUsingGoogleAccUseCase = signInUsingGoogleAccUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _getStoredUserUseCase = getStoredUserUseCase,
        super(
          AuthState.empty(),
        ) {
    on<InitAuthEvent>(_onInitAuth);
    on<SignInEvent>(_onSignIn);
    on<SignInUsingGoogleAccEvent>(_onGoogleSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreen);
    on<NavigateToSignInScreenEvent>(_onNavigateToSignInScreen);
    on<NavigateToSignUpScreenEvent>(_onNavigateToSignUpScreen);

    add(const InitAuthEvent());
  }

  Future<void> _onInitAuth(
    InitAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final AppUser user = await _getStoredUserUseCase.execute(
      const NoParams(),
    );
    if (user.id == '') {
      emit(
        state.copyWith(
          user: const AppUser(
            id: '',
            name: '',
            email: '',
          ),
          isLogged: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          user: user,
          isLogged: true,
        ),
      );
    }
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final AppUser user = await _signInUseCase.execute(
        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );
      emit(
        state.copyWith(
          formState: const SuccessFormState(),
          user: user,
        ),
      );
    } on FirebaseAuthException catch (error) {
      state.copyWith(
        formState: FailedFormState(
          error.message,
        ),
      );
    }
  }

  Future<void> _onGoogleSignIn(
    SignInUsingGoogleAccEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final AppUser user = await _signInUsingGoogleAccUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(user: user),
      );
      _appRouter.replace(const HomePageRoute());
    } catch (error) {
      emit(
        state.copyWith(
          formState: FailedFormState(
            error.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final AppUser user = await _signUpUseCase.execute(
        SignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      emit(
        state.copyWith(
          formState: const SuccessFormState(),
          user: user,
        ),
      );
    } on FirebaseAuthException catch (error) {
      state.copyWith(
        formState: FailedFormState(
          error.message,
        ),
      );
    }
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        isLogged: false,
        formState: const InitFormState(),
      ),
    );
  }

  Future<void> _onNavigateToHomeScreen(
    NavigateToHomeScreenEvent event,
    Emitter<AuthState> emit,
  ) async {
    _appRouter.replace(const HomePageRoute());
  }

  Future<void> _onNavigateToSignInScreen(
    NavigateToSignInScreenEvent event,
    Emitter<AuthState> emit,
  ) async {
    _appRouter.replace(const SignInScreenRoute());
  }

  Future<void> _onNavigateToSignUpScreen(
    NavigateToSignUpScreenEvent event,
    Emitter<AuthState> emit,
  ) async {
    _appRouter.replace(const SignUpScreenRoute());
  }
}
