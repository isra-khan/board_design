import 'package:flutter/material.dart';

class LudoBoard extends StatelessWidget {
  final double size;

  const LudoBoard({Key? key, this.size = 320}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cellSize = size / 15; // Standard ludo board: 15x15 grid

    return SizedBox(
      width: size,
      height: size,
      child: Column(
        children: List.generate(15, (row) {
          return Row(
            children: List.generate(15, (col) {
              Color color;

              // Define colored zones for each player's home
              if (row < 6 && col < 6) {
                color = Colors.red.shade300;
              } else if (row < 6 && col > 8) {
                color = Colors.green.shade300;
              } else if (row > 8 && col < 6) {
                color = Colors.yellow.shade300;
              } else if (row > 8 && col > 8) {
                color = Colors.blue.shade300;
              } else {
                color = Colors.white;
              }

              // Middle cross (safe path)
              if ((row == 7) || (col == 7)) {
                color = Colors.grey.shade300;
              }

              // Center square
              if (row >= 6 && row <= 8 && col >= 6 && col <= 8) {
                color = Colors.grey.shade500;
              }

              return Container(
                width: cellSize,
                height: cellSize,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: color,
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}

// Example app to display the Ludo board

class LudoBoardDemoApp extends StatelessWidget {
  const LudoBoardDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Ludo Board')),
        body: const Center(child: LudoBoard(size: 360)),
      ),
    );
  }
}
