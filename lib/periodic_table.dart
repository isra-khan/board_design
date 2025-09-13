import 'package:flutter/material.dart';

/// A very simple Periodic Table layout (grid with element symbols).
/// This is a simplified example: it places elements in approximate groups/periods,
/// but not all advanced spacing is included.
class PeriodicTable extends StatelessWidget {
  final double cellSize;

  const PeriodicTable({Key? key, this.cellSize = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simplified list of element symbols row by row (empty = gap)
    final table = [
      ["H", "", "", "", "", "", "", "", "", "", "", "", "", "", "He"],
      [
        "Li",
        "Be",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "B",
        "C",
        "N",
        "O",
        "F",
        "Ne",
      ],
      [
        "Na",
        "Mg",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "Al",
        "Si",
        "P",
        "S",
        "Cl",
        "Ar",
      ],
      [
        "K",
        "Ca",
        "Sc",
        "Ti",
        "V",
        "Cr",
        "Mn",
        "Fe",
        "Co",
        "Ni",
        "Cu",
        "Zn",
        "Ga",
        "Ge",
        "As",
        "Se",
        "Br",
        "Kr",
      ],
      // ... can extend for full periodic table
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: table.map((row) {
          return Row(
            children: row.map((symbol) {
              if (symbol.isEmpty) {
                return SizedBox(width: cellSize, height: cellSize);
              }
              return Container(
                width: cellSize,
                height: cellSize,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: Colors.lightBlue.shade50,
                ),
                child: Center(
                  child: Text(
                    symbol,
                    style: TextStyle(
                      fontSize: cellSize * 0.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}

// Example app to display the Periodic Table
void main() {
  runApp(const PeriodicTableDemoApp());
}

class PeriodicTableDemoApp extends StatelessWidget {
  const PeriodicTableDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Periodic Table')),
        body: const Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PeriodicTable(cellSize: 40),
          ),
        ),
      ),
    );
  }
}
