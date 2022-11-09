import 'package:flutter/material.dart';
import 'package:foresight/shared/snapshot_states/snapshot_state.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmptyState extends StatelessWidget {
  final String text;

  const EmptyState({super.key, this.text = 'Nenhum item encontrado'});

  @override
  Widget build(BuildContext context) {
    return SnapshotState(
      text: text,
      icon: PhosphorIcons.placeholder,
    );
  }
}
