import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:iattened/presentation/screens/home.dart';
import 'package:iattened/presentation/screens/login.dart';
import 'package:iattened/presentation/screens/register.dart';
import 'package:iattened/router/guard.dart';

import '../presentation/screens/sectionscreen.dart';

@MaterialAutoRouter(routes: [
  CustomRoute(page: LoginScreen, initial: true, guards: [AuthGuard]),
  CustomRoute(page: RegisterScreen),
  CustomRoute(page: HomeScreen),
  // CustomRoute(page: SectionScreen),
], replaceInRouteName: "Page,Route")
class $AppRouter {}
