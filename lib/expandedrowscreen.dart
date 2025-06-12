import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedRowScreen extends StatefulWidget {
  const ExpandedRowScreen({super.key});

  @override
  State<ExpandedRowScreen> createState() => _ExpandedRowScreenState();
}

class _ExpandedRowScreenState extends State<ExpandedRowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Expanded Demo')),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          // Background for the Row to show its bounds
          height: 150,
          // Fixed height for the Row to clearly see cross-axis alignment
          width: double.infinity,

          // Row takes full width of the screen
          child: Row(
            // --- Main Axis Properties ---
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // Distributes space evenly around children
            mainAxisSize: MainAxisSize.max,
            // Row takes as much horizontal space as available

            // --- Cross Axis Properties ---
            crossAxisAlignment: CrossAxisAlignment.start,

            // Children will stretch vertically to fill Row's height
            children: <Widget>[
              // --- Fixed Size Widget 1 ---
              Container(
                width: 60,
                height: 80, // Shorter than Row's height
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Fixed 1',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // --- Expanded Widget 1 (flex: 1) ---
              Expanded(
                flex: 1, // Takes 1 part of the remaining space
                child: Container(
                  // No explicit width, it's determined by Expanded
                  height: 120,
                  // Taller than Fixed 1, but shorter than Row's height
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  // Add some spacing
                  child: const Center(
                    child: Text(
                      'Expanded 1 (Flex 1)',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // --- Fixed Size Widget 2 ---
              Container(
                width: 90,
                height: 40, // Still shorter than Row's height
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Fixed 2',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // --- Expanded Widget 2 (flex: 2) ---
              Expanded(
                flex: 1,
                // Takes 2 parts of the remaining space (twice as much as Expanded 1)
                child: Container(
                  // Simulate "min size" for the child within Expanded.
                  // If the calculated flex space was less than, say, 50px,
                  // this inner child would still try to render at 50px, potentially overflowing.
                  // However, Expanded itself usually forces the child to fill the space.
                  constraints: const BoxConstraints(
                    minWidth: 50,
                    minHeight: 70,
                  ),
                  // Example min constraints
                  height: 150,
                  // Tallest child height, but will be stretched by Row's crossAxisAlignment
                  color: Colors.purple,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  // Add some spacing
                  child: const Center(
                    child: Text(
                      'Expanded 2 (Flex 2) - Min Height 70 (ignored by stretch)',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
