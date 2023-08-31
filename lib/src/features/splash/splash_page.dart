import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/messages.dart';
import '../auth/login/login_page.dart';
import 'splash_vm.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  static const int animationDuration = 1;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 120 * _scale;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1;
        _scale = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashVmProvider, (_, state) {
      state.whenOrNull(error: (error, stackTrace) {
        log('Erro ao validar login', error: error, stackTrace: stackTrace);
        Messages.showError(context, 'Erro ao validar login');
        Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
      }, data: (data) {
        switch (data) {
          case SplashVmStatus.loggedAdm:
            Navigator.of(context).pushNamedAndRemoveUntil('/home/adm', (route) => false);
          case SplashVmStatus.loggedEmployee:
            Navigator.of(context).pushNamedAndRemoveUntil('/home/employee', (route) => false);
          case _:
            Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
        }
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundChair),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: animationDuration),
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            onEnd: () {
              Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                  settings: const RouteSettings(name: '/auth/login'),
                  pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                  ) {
                    return const LoginPage();
                  },
                  transitionsBuilder: (
                    _,
                    animation,
                    __,
                    child,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
                (route) => false,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: animationDuration),
              curve: Curves.linearToEaseOut,
              width: _logoAnimationWidth,
              height: _logoAnimationHeight,
              child: Image.asset(
                AppAssets.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
