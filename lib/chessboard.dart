import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  final double size;

  const ChessBoard({Key? key, this.size = 320}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final squareSize = size / 8;

    return SizedBox(
      width: size,
      height: size,
      child: Column(
        children: List.generate(8, (rowIndex) {
          return Row(
            children: List.generate(8, (colIndex) {
              final isLight = (rowIndex + colIndex) % 2 == 0;
              return Container(
                width: squareSize,
                height: squareSize,
                color: isLight ? Colors.white : Colors.black,
              );
            }),
          );
        }),
      ),
    );
  }
}

class ChessBoardDemoApp extends StatelessWidget {
  const ChessBoardDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Chess Board')),
        body: const Center(child: ChessBoard(size: 320)),
      ),
    );
  }
}
