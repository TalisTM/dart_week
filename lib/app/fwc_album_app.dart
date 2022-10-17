import 'package:dart_week/app/core/rest/custom_dio.dart';
import 'package:dart_week/app/core/ui/global/global_context.dart';
import 'package:dart_week/app/core/ui/global/global_context_impl.dart';
import 'package:dart_week/app/core/ui/theme/theme_config.dart';
import 'package:dart_week/app/pages/auth/login/login_route.dart';
import 'package:dart_week/app/pages/auth/register/register_route.dart';
import 'package:dart_week/app/pages/home/home_route.dart';
import 'package:dart_week/app/pages/my_styckers/my_stickers_route.dart';
import 'package:dart_week/app/pages/splash/splash_route.dart';
import 'package:dart_week/app/repository/auth/auth_repository.dart';
import 'package:dart_week/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FwcAlbumApp extends StatelessWidget {
  final vavigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(navigatorKey: vavigatorKey, authRepository: i()),
        ),
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        debugShowCheckedModeBanner: false,
        navigatorKey: vavigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          "/": (_) => const SplashRoute(),
          "/auth/login": (_) => const LoginRoute(),
          "/auth/register": (_) => const RegisterRoute(),
          "/home": (_) => const HomeRoute(),
          "/my-stickers": (_) => const MyStickersRoute()
        },
      ),
    );
  }
}
