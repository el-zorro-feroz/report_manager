import 'package:flutter/material.dart';

/// Returns an instance of [ControlPanelWidget]
class ControlPanelWidget extends StatelessWidget {
  /// Returns an instance of [ControlPanelWidget]
  const ControlPanelWidget({
    this.onNewReportPressed,
    super.key,
  });

  ///
  final VoidCallback? onNewReportPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _ActionGroup(
            onNewReportPressed: onNewReportPressed,
          ),
          const Spacer(),
          const _TimePicker(),
        ],
      ),
    );
  }
}

class _ActionGroup extends StatelessWidget {
  const _ActionGroup({
    required this.onNewReportPressed,
  });

  final VoidCallback? onNewReportPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onNewReportPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.shade200,
        ),
        child: const Text(
          'Добавить отчет',
        ),
      ),
    );
  }
}

class _TimePicker extends StatelessWidget {
  const _TimePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade200,
      ),
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Отображать с: '),
            TextSpan(
              text: '01.02.2024',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: Text('-'),
              ),
            ),
            TextSpan(text: 'по: '),
            TextSpan(
              text: '01.03.2024',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
