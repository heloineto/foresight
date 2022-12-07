import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class BiometricsPage extends StatefulWidget {
  final void Function() onSuccess;
  final void Function() onUnsupported;
  const BiometricsPage({
    super.key,
    required this.onSuccess,
    required this.onUnsupported,
  });

  @override
  State<BiometricsPage> createState() => _BiometricsPageState();
}

class _BiometricsPageState extends State<BiometricsPage> {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  bool? canCheckBiometrics;
  String authorizedState = 'Não iniciada';
  bool isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
      (bool isSupported) {
        setState(() {
          supportState =
              isSupported ? SupportState.supported : SupportState.unsupported;
        });

        if (!isSupported) {
          widget.onUnsupported();
        }
      },
    );

    checkBiometrics();
  }

  Future<void> checkBiometrics() async {
    late bool authCanCheckBiometrics;
    try {
      authCanCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (error) {
      authCanCheckBiometrics = false;
      debugPrint(error.toString());
    }
    if (!mounted) {
      return;
    }

    setState(() {
      canCheckBiometrics = authCanCheckBiometrics;
    });
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        isAuthenticating = true;
        authorizedState = 'Autenticando...';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Verifique sua identidade para ver suas informações financeiras',
        options: const AuthenticationOptions(stickyAuth: true),
      );
      setState(() {
        isAuthenticating = false;
      });
    } on PlatformException catch (error) {
      debugPrint(error.toString());
      setState(() {
        isAuthenticating = false;
        authorizedState = 'Erro: ${error.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(() {
      authorizedState = authenticated ? 'Autorizada' : 'Não Autorizada';
    });

    if (authenticated) {
      widget.onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text('Pressione o botão abaixo para autenticar'),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  elevation: 0,
                  hoverElevation: 0,
                  focusElevation: 0,
                  disabledElevation: 0,
                  highlightElevation: 0,
                  tooltip: 'Autenticar',
                  onPressed: () {
                    if (!isAuthenticating) {
                      authenticate();
                    }
                  },
                  backgroundColor: TW3Colors.emerald,
                  child: isAuthenticating
                      ? const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Icon(
                          PhosphorIcons.fingerprintBold,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/assets/icon.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 50),
                if (supportState == SupportState.unknown)
                  const CircularProgressIndicator()
                else
                  Text(
                    supportState == SupportState.supported
                        ? 'Este dispositivo suporta autentificação local'
                        : 'Este dispositivo NÃO suporta autentificação local',
                  ),
                const Divider(height: 100),
                if (canCheckBiometrics != null)
                  Text(
                    canCheckBiometrics!
                        ? 'Este dispositivo possui sensores biométricos'
                        : 'Este dispositivo NÃO possui sensores biométricos',
                  )
                else
                  const CircularProgressIndicator(),
                const Divider(height: 100),
                Text('Estado da autentificação: $authorizedState\n'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
