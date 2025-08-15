// File: PlanTable.dart
import 'package:ai_sys/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class PlanTable extends StatefulWidget {
  final List<Map<String, dynamic>> users;
  final List<String> columnNames;

  const PlanTable({required this.users, required this.columnNames, super.key});

  @override
  State<PlanTable> createState() => _PlanTableState();
}

class _PlanTableState extends State<PlanTable> {
  final double leftColumnWidth = 120;
  late double columnWidth;
  late int rightColumnCount;

  @override
  Widget build(BuildContext context) {
    rightColumnCount = widget.columnNames.length - 1;
    final screenWidth = MediaQuery.of(context).size.width;
    final double availableWidth = screenWidth - leftColumnWidth - 60; // padding
    columnWidth = availableWidth / rightColumnCount;

    return LayoutBuilder(
      builder: (context, constraints) {
        const double headerHeight = 50;
        const double rowHeight = 50;
        final double totalHeight =
            headerHeight + widget.users.length * rowHeight;
        final double tableHeight = totalHeight < constraints.maxHeight
            ? totalHeight
            : constraints.maxHeight;

        return SizedBox(
          height: tableHeight,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: leftColumnWidth,
            rightHandSideColumnWidth: columnWidth * rightColumnCount,
            isFixedHeader: true,
            headerWidgets: CreateHeader(),
            leftSideItemBuilder: CreateLeftColumn,
            rightSideItemBuilder: CreateRightColumns,
            itemCount: widget.users.length,
            rowSeparatorWidget: const Divider(color: Colors.black54, height: 1),
            leftHandSideColBackgroundColor: Colors.blue.shade100,
            rightHandSideColBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }

  List<Widget> CreateHeader() {
    return widget.columnNames.map((name) {
      final bool isLeft = name == widget.columnNames.first;
      return Container(
        width: isLeft ? leftColumnWidth : columnWidth,
        height: 50,
        alignment: Alignment.center,
        color: primaryColor,
        child: Text(name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      );
    }).toList();
  }

  Widget CreateLeftColumn(BuildContext context, int index) {
    final value = widget.users[index][widget.columnNames.first];
    return Container(
      width: leftColumnWidth,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blue.shade50,
      child: Text(value.toString()),
    );
  }

  Widget CreateRightColumns(BuildContext context, int index) {
    return Row(
      children: widget.columnNames.skip(1).map((colName) {
        final value = widget.users[index][colName];
        if (colName == "Status" && value is bool) {
          return Container(
            width: columnWidth,
            height: 50,
            alignment: Alignment.center,
            child: FlutterSwitch(
              width: 50,
              height: 25,
              value: value,
              borderRadius: 30,
              padding: 4,
              activeColor: Colors.green,
              onToggle: (v) => setState(() => widget.users[index][colName] = v),
            ),
          );
        }
        return Container(
          width: columnWidth,
          height: 50,
          alignment: Alignment.center,
          child:
              Text(value?.toString() ?? "-", overflow: TextOverflow.ellipsis),
        );
      }).toList(),
    );
  }
}
