import 'package:flutter/cupertino.dart';
import 'package:foresight/shared/snapshot_states/snapshot_state.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ErrorState extends StatelessWidget {
  final String text;

  const ErrorState({super.key, this.text = 'Algo deu errado'});

  @override
  Widget build(BuildContext context) {
    return SnapshotState(
      text: text,
      icon: PhosphorIcons.smileyXEyes,
    );
  }
}
