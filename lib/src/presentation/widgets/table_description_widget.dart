import 'package:flutter/material.dart';

/// Returns an instance of [TableDescriptionWidget]
class TableDescriptionWidget extends StatelessWidget {
  /// Returns an instance of [TableDescriptionWidget]
  const TableDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child: Text('ДАТА')),
          Expanded(child: Text('ФИО')),
          Expanded(child: Text('ПОДРУБ. МАШИНА')),
          Expanded(child: Text('НА НАЧАЛО')),
          Expanded(child: Text('НА КОНЕЦ')),
          Expanded(child: Text('ЗАПРАВКА')),
          Expanded(child: Text('ИЗРАСХОДОВАНО')),
          Expanded(child: Text('ОСТАТОК')),
        ],
      ),
    );
  }
}
