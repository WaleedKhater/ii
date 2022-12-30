import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/contracts/i.firebase.facade.dart';
import '../../infrastructure/auth/firebase.auth.facade.dart';

final firebaseauthFacadeProvider = Provider<IFirebaseAuthFacade>((ref)=>FirebaseAuthFacade());

